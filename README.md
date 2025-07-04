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
git clone https://github.com/IPSamos/shiny-qPCR-analysis.git

2. Open R or RStudio.

3. Install required packages (if not already installed):

`install.packages(c(
  "shiny", "bslib", "shinythemes", "dplyr", "ggplot2", 
  "plotly", "readr", "writexl"
))`

4. Set your working directory to the folder where you downloaded the app.

5. Run the app:

`shiny::runApp()`

# Usage
1. Upload your qPCR data file (CSV, exported from your qPCR device; decimal separator must be a point, and all commas should be removed).
2. Upload your standard values file (CSV, following the provided template).
3. Click Process Data.
4. View the Standard Curve and regression details.
5. Go to the Processed Data tab to see calculated copies per µL and download results.

**Note**: You will find a template of the qPCR data and the Standard values data. The columns used need to be exactly as explained in the mentioned templates.

License:
This project is licensed under the Creative Commons Attribution-NonCommercial 4.0 International License (CC BY-NC 4.0).
See the LICENSE file for details.

Author:
Ivan P. Samos
