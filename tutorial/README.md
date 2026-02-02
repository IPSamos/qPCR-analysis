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


Regarding the "Template table" for the selected samples, it looks like this. You can prepare it, for instance, with Microsoft Excel. **The easy way of getting this table is downloading it from the app. I added that option in the first tab.** 
It only has four columns (_Sample_, _Dilution.factor_, _Well1_, _Well2_ and _Well3_), and **they need to be named exactly as written previosly**. It is a .xlsx file. See an example below:

<img width="592" height="648" alt="image" src="https://github.com/user-attachments/assets/a6ca08c9-ac62-401b-8cd1-dfc0582d16b8" />


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

<img width="1906" height="953" alt="image" src="https://github.com/user-attachments/assets/192e8b7c-f737-4384-be74-c412b1f7676a" />

Now, just upload the qPCR data in the right spot, and the same with the "Template table". If you need a "Template table" you can scroll in this first tab and download it. **If you need a "Template table" you can scroll in this first tab and download it.**
<img width="1862" height="902" alt="image" src="https://github.com/user-attachments/assets/b8d32b99-eb77-48d7-ae76-bf4704f354fa" />

<img width="1823" height="727" alt="image" src="https://github.com/user-attachments/assets/89ae8e23-fcd9-45ce-ae23-d5487be74402" />

Then you can navigate through the app and check the results' table, and download it in .csv or .xlsx
The results using the example data are these:


**Results' table**:

<img width="1842" height="871" alt="image" src="https://github.com/user-attachments/assets/dec24338-75c1-4353-a1e5-a9a5bcca336b" />


I hope this tutorial was helpful to understand how this works. It is easy and will just require a few minutes to make it work. 
Any questions or doubts, please, don't hesitate and contact me. 
