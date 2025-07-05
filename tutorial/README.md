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

_Being std the standards (up to you how you set this experiment up), and SX are the samples._

Once we got our qPCR done, the device gave us multiple output files. The one that we were looking at were the one you see in the "template" folder. 
While the qPCR was running, we prepared the "standards" file. 
You can see how they look below. 

**Datasets:**

The output from the qPCR was named "XXXXXXXX - Quantification Cq Results.csv". Your qPCR may name it differently, but the table that you need to use is like the one you can see below. Through the tutorial, and in the description of this app, it is mentioned that the columns used are "Well" and "Starting.Quantity..SQ.". This second name might look weird, but it is exactly the name provided by the output of the qPCR, and the aim of this is to make it easy, so my team can use the output of the qPCR directly into the ShinyApp. If your column's name doesn't look like this, you can always change the name very easily by opening it in Microsoft Excel or opening it with the NotePad, and this app will work for you as well. 

Let me show you how it looks like if opening it in Excel. It is a .csv file, and the separator is ";":

![Captura de pantalla 2025-07-05 121517](https://github.com/user-attachments/assets/0bb8ddfb-6e4b-4cbd-bc52-dd7fb1d9c04e)

Regarding the standards' file, it looks like this.
It only has two columns (_Well_ and _Copies.uL_), and **they need to be named exactly as written previosly**. It is a .csv file, and the separator is ";":

![Captura de pantalla 2025-07-05 122202](https://github.com/user-attachments/assets/96191195-a6c0-494d-88b4-9c0f1a740829)


# Analysis of data

Now we have our data prepared. It's time to open the ShinyApp. 










