library(shiny)
library(shinythemes) # For themes
library(dplyr)
library(ggplot2)
library(readr)
library(writexl) # For exporting to .xlsx

# Define UI
ui <- navbarPage(
  theme = shinytheme("flatly"), # Apply a modern theme
  "qPCR Analysis",
  
  # Page 1: File Upload and Process Button
  tabPanel(
    "Upload Data",
    sidebarLayout(
      sidebarPanel(
        h4("Upload Files"),
        fileInput("dataFile", "Upload Data File (CSV)", accept = ".csv"),
        fileInput("standardFile", "Upload Standard Values File (CSV)", accept = ".csv"),
        actionButton("process", "Process Data", class = "btn btn-primary"),
        br(),
        br(),
        p("Please upload your files and click 'Process Data' to proceed.")
      ),
      mainPanel(
        h3("Welcome to the qPCR Analysis App"),
        p("This app allows you to analyze qPCR data, generate standard curves, and calculate copies per µL."),
        tags$hr(),
        h4("Instructions"),
        p("1. You will get the data from the qPCR device. The file that you need is the 'Quantification Cq Results', and the decimal separator needs to be a point. Remove all the commas from the file."),
        p("2. The standard values' file needs to follow an exact format. You can see the template below:"),
        p("IMPORTANT: Notice that the standards need to be in the first three columns while doing the PCR"),
        tags$table(
          style = "width: 50%; margin: 20px auto; border-collapse: collapse; text-align: center;",
          tags$thead(
            tags$tr(
              tags$th("Well", style = "border: 1px solid black; padding: 5px;"),
              tags$th("Copies.uL", style = "border: 1px solid black; padding: 5px;")
            )
          ),
          tags$tbody(
            tags$tr(
              tags$td("A01", style = "border: 1px solid black; padding: 5px;"),
              tags$td("15.81242", style = "border: 1px solid black; padding: 5px;")
            ),
            tags$tr(
              tags$td("B01", style = "border: 1px solid black; padding: 5px;"),
              tags$td("158.1242", style = "border: 1px solid black; padding: 5px;")
            ),
            tags$tr(
              tags$td("C01", style = "border: 1px solid black; padding: 5px;"),
              tags$td("1581.242", style = "border: 1px solid black; padding: 5px;")
            ),
            tags$tr(
              tags$td("D01", style = "border: 1px solid black; padding: 5px;"),
              tags$td("15812.42", style = "border: 1px solid black; padding: 5px;")
            ),
            tags$tr(
              tags$td("E01", style = "border: 1px solid black; padding: 5px;"),
              tags$td("158124.2", style = "border: 1px solid black; padding: 5px;")
            ),
            tags$tr(
              tags$td("F01", style = "border: 1px solid black; padding: 5px;"),
              tags$td("1581242", style = "border: 1px solid black; padding: 5px;")
            ),
            tags$tr(
              tags$td("G01", style = "border: 1px solid black; padding: 5px;"),
              tags$td("15812417", style = "border: 1px solid black; padding: 5px;")
            ),
            tags$tr(
              tags$td("H01", style = "border: 1px solid black; padding: 5px;"),
              tags$td("1.58E+08", style = "border: 1px solid black; padding: 5px;")
            ),
            tags$tr(
              tags$td("A02", style = "border: 1px solid black; padding: 5px;"),
              tags$td("15.81242", style = "border: 1px solid black; padding: 5px;")
            ),
            tags$tr(
              tags$td("B02", style = "border: 1px solid black; padding: 5px;"),
              tags$td("158.1242", style = "border: 1px solid black; padding: 5px;")
            ),
            tags$tr(
              tags$td("...", style = "border: 1px solid black; padding: 5px;"),
              tags$td("...", style = "border: 1px solid black; padding: 5px;"),
            ),
          )
        ),
        p("3. Upload your qPCR data file and standard values file in CSV format."),
        p("4. Click the 'Process Data' button to analyze the data."),
        p("5. Navigate to the 'Standard Curve' tab to view the regression plot and equation."),
        p("6. Navigate to the 'Processed Data' tab to view the calculated copies per µL and download the results."),
        tags$hr(),
        div(
          style = "text-align: center; margin-top: 20px;",
          HTML("&copy; 2025 Ivan P. Samos")
        )
      )
    )
  ),
  
  # Page 2: Standard Curve
  tabPanel(
    "Standard Curve",
    fluidRow(
      column(8, plotOutput("standardCurvePlot")),
      column(4, 
             h4("Regression Details"),
             verbatimTextOutput("regressionInfo"),
             downloadButton("downloadPlot", "Download Standard Curve as PNG", class = "btn btn-success")
      )
    ),
    div(
      style = "text-align: center; margin-top: 20px;",
      HTML("&copy; 2025 Ivan P. Samos")
    )
  ),
  
  # Page 3: Processed Data Table
  tabPanel(
    div(icon("table"), "Processed Data"), # Add an icon to the tab
    fluidRow(
      column(12,
             h4("Download Processed Data"),
             p("Notice that the third column it's just to check if the value enters into the calculation range."),
             p("TRUE: The value doesn't enter into the calculation range. The calculation is done anyways but be aware of it."),
             p("FALSE: The value enters into the calculation range."),
             downloadButton("downloadCSV", "Download as CSV", class = "btn btn-info"),
             downloadButton("downloadXLSX", "Download as Excel File", class = "btn btn-info"),
             br(),
             br(),
             tableOutput("processedData")
      )
    ),
    div(
      style = "text-align: center; margin-top: 20px;",
      HTML("&copy; 2025 Ivan P. Samos")
    )
  )
)

# Define Server
server <- function(input, output) {
  # Reactive values to store processed data
  values <- reactiveValues(data = NULL, standard_values2 = NULL, model = NULL)
  
  observeEvent(input$process, {
    req(input$dataFile, input$standardFile)
    
    # Read data files
    data <- read.csv(input$dataFile$datapath, header = TRUE, sep = ";")
    standard <- read.csv(input$standardFile$datapath, header = TRUE, sep = ";")
    
    # Process data
    data <- data %>%
      select(Well, Starting.Quantity..SQ.) %>%
      mutate(Starting.Quantity..SQ. = gsub(",", "", Starting.Quantity..SQ.)) %>%
      mutate(SQ = as.numeric(Starting.Quantity..SQ.))
    
    # Split into standard values and data
    standard_values <- data %>%
      filter(Well %in% c("A01", "B01", "C01", "D01", "E01", "F01", "G01", "H01",
                         "A02", "B02", "C02", "D02", "E02", "F02", "G02", "H02",
                         "A03", "B03", "C03", "D03", "E03", "F03", "G03", "H03")) %>%
      filter(!is.na(SQ)) # Remove NA values from standard_values
    
    data <- data %>%
      filter(!Well %in% c("A01", "B01", "C01", "D01", "E01", "F01", "G01", "H01",
                          "A02", "B02", "C02", "D02", "E02", "F02", "G02", "H02",
                          "A03", "B03", "C03", "D03", "E03", "F03", "G03", "H03")) %>%
      filter(!is.na(SQ)) # Remove NA values from data
    
    standard_values2 <- merge(standard, standard_values, by = "Well") %>%
      select(-Well)
    
    model <- lm(SQ ~ Copies.uL, data = standard_values2)
    
    # Store processed data in reactive values
    values$data <- data
    values$standard_values2 <- standard_values2
    values$model <- model
  })
  
  # Standard Curve Plot
  output$standardCurvePlot <- renderPlot({
    req(values$standard_values2, values$model)
    slope <- coef(values$model)[2]
    intercept <- coef(values$model)[1]
    r_squared <- summary(values$model)$r.squared
    
    ggplot(values$standard_values2, aes(x = Copies.uL, y = SQ)) +
      geom_point(color = "blue", size = 3) +
      geom_smooth(method = "lm", se = FALSE, color = "red", size = 1) +
      labs(
        title = "Standard Curve",
        x = "Copies per µL",
        y = "SQ"
      ) +
      theme_minimal() +
      theme(
        panel.background = element_rect(fill = "white", color = NA), # White background, no border
        plot.background = element_rect(fill = "white", color = NA), # White background for the entire plot
        axis.title = element_text(size = 16, face = "bold"), # Larger axis titles
        axis.text = element_text(size = 14), # Larger axis labels
        plot.title = element_text(size = 18, face = "bold", hjust = 0.5), # Centered and larger plot title
        panel.grid.major = element_line(color = "gray90"), # Light grid lines
        panel.grid.minor = element_line(color = "gray95") # Lighter grid lines
      ) +
      annotate(
        "text",
        x = max(values$standard_values2$Copies.uL) * 0.7, 
        y = max(values$standard_values2$SQ) * 0.9,
        label = paste("y =", round(slope, 2), "* x +", round(intercept, 2), 
                      "\nR² =", round(r_squared, 3)),
        color = "black",
        size = 5, # Increased annotation text size
        hjust = 0
      )
  })
  
  # Regression Equation and R²
  output$regressionInfo <- renderText({
    req(values$model)
    slope <- coef(values$model)[2]
    intercept <- coef(values$model)[1]
    r_squared <- summary(values$model)$r.squared
    
    paste("Regression Equation: y =", round(slope, 2), "* x +", round(intercept, 2),
          "\nR² =", round(r_squared, 3))
  })
  
  # Processed Data Table
  processedData <- reactive({
    req(values$data, values$model, values$standard_values2)
    slope <- coef(values$model)[2]
    intercept <- coef(values$model)[1]
    min_SQ <- min(values$standard_values2$SQ, na.rm = TRUE)
    max_SQ <- max(values$standard_values2$SQ, na.rm = TRUE)
    
    values$data %>%
      mutate(
        Copies.µL = (SQ - intercept) / slope,
        outside_range = ifelse(SQ < min_SQ | SQ > max_SQ, TRUE, FALSE)
      ) %>%
      select(Well, Copies.µL, outside_range)
  })
  
  output$processedData <- renderTable({
    processedData()
  })
  
  # Download as CSV
  output$downloadCSV <- downloadHandler(
    filename = function() {
      paste("processed_data", Sys.Date(), ".csv", sep = "")
    },
    content = function(file) {
      write.csv(processedData(), file, row.names = FALSE)
    }
  )
  
  # Download as Excel File (.xlsx)
  output$downloadXLSX <- downloadHandler(
    filename = function() {
      paste("processed_data", Sys.Date(), ".xlsx", sep = "")
    },
    content = function(file) {
      writexl::write_xlsx(processedData(), file)
    }
  )
  
  # Download Standard Curve Plot
  output$downloadPlot <- downloadHandler(
    filename = function() {
      paste("standard_curve", Sys.Date(), ".png", sep = "")
    },
    content = function(file) {
      req(values$standard_values2, values$model)
      slope <- coef(values$model)[2]
      intercept <- coef(values$model)[1]
      r_squared <- summary(values$model)$r.squared
      
      plot <- ggplot(values$standard_values2, aes(x = Copies.uL, y = SQ)) +
        geom_point(color = "blue", size = 3) +
        geom_smooth(method = "lm", se = FALSE, color = "red", size = 1) +
        labs(
          title = "Standard Curve",
          x = "Copies per µL",
          y = "SQ"
        ) +
        theme_minimal() +
        theme(
          panel.background = element_rect(fill = "white", color = NA), # White background, no border
          plot.background = element_rect(fill = "white", color = NA), # White background for the entire plot
          axis.title = element_text(size = 16, face = "bold"), # Larger axis titles
          axis.text = element_text(size = 14), # Larger axis labels
          plot.title = element_text(size = 18, face = "bold", hjust = 0.5), # Centered and larger plot title
          panel.grid.major = element_line(color = "gray90"), # Light grid lines
          panel.grid.minor = element_line(color = "gray95") # Lighter grid lines
        ) +
        annotate(
          "text",
          x = max(values$standard_values2$Copies.uL) * 0.7, 
          y = max(values$standard_values2$SQ) * 0.9,
          label = paste("y =", round(slope, 2), "* x +", round(intercept, 2), 
                        "\nR² =", round(r_squared, 3)),
          color = "black",
          size = 5, # Increased annotation text size
          hjust = 0
        )
      
      ggsave(file, plot = plot, width = 8, height = 6)
    }
  )
}

# Run the application
shinyApp(ui = ui, server = server)
