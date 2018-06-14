import math, sequtils

proc square_of_sum*(n: Natural): Natural = 
  (n * (n + 1) div 2) ^ 2

proc sum_of_squares*(n: Natural): Natural  = 
  (1..n).mapIt(it ^ 2).sum

proc difference*(n: Natural): Natural  = 
  n.square_of_sum - n.sum_of_squares

