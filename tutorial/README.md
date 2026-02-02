# Generation of the data
We run a qPCR of the 16S genes of multiples samples. Our objective was to see how many of a certain type of bacteria were there. Our layout was like this:

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

_Being "std" the standards (up to you how you set this experiment up), and "SX" the samples._

Once we got our qPCR done, the device gave us multiple output files. The one that we were looking at was the one you see in the "template" folder. 
While the qPCR was running, we prepared the "standards" file. 
You can see how they look below. 

**Datasets:**

The output from the qPCR was named "XXXXXXXX - Quantification Cq Results.csv". Your qPCR may name it differently, but the table that you need to use is like the one you can see below. Through the tutorial, and in the description of this app, it is mentioned that the columns used are "Well" and "Starting.Quantity..SQ.". This second name might look weird, but it is exactly the name provided by the output of the qPCR, and the aim of this is to make it easy, so my team can use the output of the qPCR directly into the ShinyApp. If your column's name doesn't look like this, you can always change the name very easily by opening it in Microsoft Excel or opening it with the NotePad, and this app will work for you as well. 

Let me show you how it looks like if opening it in Excel. It is a .csv file, and the separator is ";":

<img width="1543" height="601" alt="image" src="https://github.com/user-attachments/assets/19eadb75-a3d0-407d-a006-19d0d2536105" />


Regarding the standards' file, it looks like this. You can prepare it, for instance, with Microsoft Excel. 
It only has two columns (_Well_ and _Copies.uL_), and **they need to be named exactly as written previosly**. It is a .csv file, and the separator is ";":

![Captura de pantalla 2025-07-05 122202](https://github.com/user-attachments/assets/96191195-a6c0-494d-88b4-9c0f1a740829)


# Analysis of data

Now we have our data prepared. It's time to open the ShinyApp. There are two ways of running this app locally (as described in the main page)

1. Clone or download this repository:
Click the green "Code" button and choose "Download ZIP", or use git: git clone https://github.com/IPSamos/qPCR-analysis.git

2. Open R or RStudio.

3. Install required packages (if not already installed):

`install.packages(c( "shiny", "bslib", "shinythemes", "dplyr", "ggplot2",  "plotly", "readr", "writexl" ))`

4. Set your working directory to the folder where you downloaded the app. This is very important. The code to set the working directory is:
   
`setwd("path/to/qPCR-analysis")`

(Or use RStudio's file pane to navigate and set the working directory.)

5. In the R console, run:

`shiny::runApp()`

Once you have run the app. It should look like this:

![image](https://github.com/user-attachments/assets/3cf7de28-8216-4ba7-b9a9-f228a8d6a6f3)

Now, just upload the qPCR data in the right spot, and the same with the standard data

![image](https://github.com/user-attachments/assets/b6cf8fac-85a0-41a7-88bc-db1703614a01)

Then you can navigate through the app and check the standard curve, the results' table, and download both. 
The results using the example data are these:

**Standard curve**:

![image](https://github.com/user-attachments/assets/bb13ac16-b949-4b5d-9c53-28b36e8c3175)

**Results' table**:

![image](https://github.com/user-attachments/assets/12c9add2-935c-4aba-837c-81f590fb4fa5)


I hope this tutorial was helpful to understand how this works. It is easy and will just require a few minutes to make it work. 
Any questions or doubts, please, don't hesitate and contact me. 
