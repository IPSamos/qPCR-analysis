# qPCR template

The only columns used are _Well_ and _Starting.Quantity..SQ._, and **they need to be named exactly as written previosly**. It is a .csv file, and the separator is ";".

The table is something similar to this

| Well | Fluor | Target | Content | Sample | Cq   | Cq Mean | Starting.Quantity..SQ. | ... |
|------|-------|--------|---------|--------|------|---------|------------------------|-----|
| A01  | SYBR  |        | Std-1   |        | 18.1 | 18.2    | 19.7                   | ... |
| A02  | SYBR  |        | Std-1   |        | 18.3 | 18.2    | 19.7                   | ... |
| A03  | SYBR  |        | Std-1   |        | 18.2 | 18.2    | 19.7                   | ... |
| A04  | SYBR  |        | Unkn    |        | NaN  | 0       | NaN                    | ... |

# Template table

It has four columns, and **they need to be named exactly as written below**. It is a .xlsx file.

| Sample    | Dilution.factor | Well1 | Well2 | Well3 |
| --------- | --------------- | ----- | ----- | ----- |
| Sample_01 | 10              | A04   | A05   | A06   |
| Sample_02 | 10              | A07   | A08   | A09   |
| Sample_03 | 10              | A10   | A11   | A12   |
| Sample_04 | 10              | B04   | B05   | B06   |
| Sample_05 | 10              | B07   | B08   | B09   |
| Sample_06 | 5               | B10   | B11   | B12   |
| Sample_07 | 10              | C04   | C05   | C06   |
