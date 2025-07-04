# qPCR Analysis Shiny App
A user-friendly Shiny web application for analyzing qPCR data. Upload your qPCR results and standard values, generate a standard curve, calculate copies per µL, and download processed results—all in one place. The app includes clear instructions and an example template for standard values.

# Features
- Upload qPCR data and standard values in CSV format
- Generate a standard curve and view regression details
- Calculate copies per µL for your samples
- Download processed results as CSV or Excel files
- Example template for standard values included
- Clear instructions and user-friendly interface

# How to Run This Shiny App Locally
1. Clone or download this repository:
   
Click the green "Code" button and choose "Download ZIP", or use git:
`git clone https://github.com/IPSamos/qPCR-analysis.git`

2. Open R or RStudio.

3. Install required packages (if not already installed):

`install.packages(c(
  "shiny", "bslib", "shinythemes", "dplyr", "ggplot2", 
  "plotly", "readr", "writexl"
))`

4. Set your working directory to the folder where you downloaded the app.

`setwd("path/to/qPCR-analysis")`

Or open the app from R/RStudio.

5. In the R console, run:

`shiny::runApp()`

# Usage
1. Upload your qPCR data file (CSV, exported from your qPCR device; decimal separator must be a point, and all commas should be removed).
2. Upload your standard values file (CSV, following the provided template).
3. Click Process Data.
4. View the Standard Curve and regression details.
5. Go to the Processed Data tab to see calculated copies per µL and download results.


# Notes

**About the files to analyse:** You will find a template of the qPCR data and the Standard values data in the folder "templates". The columns used need to be exactly as explained in the mentioned templates.

**IMPORTANT**: When preparing the qPCR, the standards used to create this app were triplicates and were placed in the first three columns of the qPCR (from A01 to H01, from A02 to H02, and from A03 to H03). The app to work doesn't require to have triplicates of the standards, **but it requires the standards to be placed in the first three columns and the samples placed from the fourth colum onwards**. You don't need to fulfill all the standard wells, or the sample wells since all the NA are removed automatically. Check the following example. 

|   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  | 11  | 12  |
|---|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|
| A | std | std | std |     |     |     |     |     |     |     |     |     |
| B | std | std | std | S1  | S1  | S1  | S8  | S8  | S8  | S15 | S15 | S15 |
| C | std | std | std | S2  | S2  | S2  | S9  | S9  | S9  | S16 | S16 | S16 |
| D | std | std | std | S3  | S3  | S3  | S10 | S10 | S10 | S17 | S17 | S17 |
| E | std | std | std | S4  | S4  | S4  | S11 | S11 | S11 | S18 | S18 | S18 |
| F | std | std | std | S5  | S5  | S5  | S12 | S12 | S12 | S19 | S19 | S19 |
| G | std | std | std | S6  | S6  | S6  | S13 | S13 | S13 | S20 | S20 | S20 |
| H | std | std | std | S7  | S7  | S7  | S14 | S14 | S14 | NC  | NC  | NC  |

---

**License:**
This project is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License (CC BY-NC 4.0).
See the LICENSE file for details.

**Author:**
Ivan P. Samos
