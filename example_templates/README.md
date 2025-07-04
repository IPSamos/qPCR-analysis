# qPCR template

The only columns used are _Well_ and _Starting.Quantity..SQ._, and **they need to be named exactly as written previosly**. It is a .csv file, and the separator is ";".

The table is something similar to this

| Well | Fluor | Target | Content | Sample | Cq   | Cq Mean | Starting.Quantity..SQ. | ... |
|------|-------|--------|---------|--------|------|---------|------------------------|-----|
| A01  | SYBR  |        | Std-1   |        | 18.1 | 18.2    | 19.7                   | ... |
| A02  | SYBR  |        | Std-1   |        | 18.3 | 18.2    | 19.7                   | ... |
| A03  | SYBR  |        | Std-1   |        | 18.2 | 18.2    | 19.7                   | ... |
| A04  | SYBR  |        | Unkn    |        | NaN  | 0       | NaN                    | ... |

# Standard values

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
