require "dataVector"

local vect1 = vector("Test1")

vect1[1] = 10
vect1[2] = 20

printVector(vect1)

local vect2 = vector("Test2",{1,2,3,4,5})

printVector(vect2)

local vect3 = vector{'A','B','C','D'}

printVector(vect3)
