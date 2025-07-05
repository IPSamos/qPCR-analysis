# Generation of the data
We run a qPCR of the 16S genes of multiples samples. Our objective was to see how many of a certain type of bacteria were there. Once we got our qPCR done, the device gave us multiple output files. The one that we were looking at were the one you see in the "template" folder. 
While the qPCR was running, we prepared the "standards" file. 
You can see how they look below. 

The output from the qPCR was named "XXXXXXXX - Quantification Cq Results.csv". Your qPCR may name it differently, but the table that you need to use is like the one you can see below. Through the tutorial, and in the description of this app, it is mentioned that the columns used are "Well" and "Starting.Quantity..SQ.". This second name might look weird, but it is exactly the name provided by the output of the qPCR, and the aim of this is to make it easy, so my team can use the output of the qPCR directly into the ShinyApp. If your column's name doesn't look like this, you can always change it very easily by opening it in Microsoft Excel or opening it with the NotePad, and this app will work for you as well. 

| Well | Fluor | Target | Content | Sample | Cq   | Cq Mean | Starting.Quantity..SQ. | ... |
|------|-------|--------|---------|--------|------|---------|------------------------|-----|
| A01  | SYBR  |        | Std-1   |        | 18.1 | 18.2    | 19.7                   | ... |
| A02  | SYBR  |        | Std-1   |        | 18.3 | 18.2    | 19.7                   | ... |
| A03  | SYBR  |        | Std-1   |        | 18.2 | 18.2    | 19.7                   | ... |
| A04  | SYBR  |        | Unkn    |        | NaN  | 0       | NaN                    | ... |

Let me show you how it looks like if opening it in Excel:

It only has two columns (_Well_ and _Copies.uL_), and **they need to be named exactly as written previosly**. It is a .csv file, and the separator is ";".

| Well | Copies.uL     |
|------|---------------|
| A01  | 15.81241685   |
| B01  | 158.1241685   |
| C01  | 1581.241685   |
| D01  | 15812.41685   |
| E01  | 158124.1685   |
| F01  | 1581241.685   |
| G01  | 15812416.85   |
| H01  | 158124168.5   |
| A02  | 15.81241685   |
