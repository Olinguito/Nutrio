calc = require './lib/bmi'


for i in [0..100]
  if i%2 == 0
    continue
  console.log calc("male",  2,  82, 1+i)

