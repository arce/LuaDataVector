require "vector"

function printVector(vct)
  print(vct.oid())
  for i=1,vct.size() do
    print(i..":"..vct[i])
  end
end

local vect1 = vector("xyz123")

vect1[1] = 10
vect1[2] = 20

local vect2 = vector("abc678")

vect2[1] = 100
vect2[2] = 200

printVector(vect1)

printVector(vect2)
