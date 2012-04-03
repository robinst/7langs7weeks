Matrix := Object clone
Matrix dim := method(
  x, y,
  data := list()
  for(i, 1, y,
    l := list()
    for(j, 1, x,
      l append(nil))
    data append(l))
  res := self clone
  res data := data
  res)

Matrix set := method(
  x, y, value,
  self data at(y) atPut(x, value))

Matrix get := method(
  x, y,
  self data at(y) at(x))

Matrix transpose := method(
  res := dim(data size, data at(0) size)
  for(y, 0, data size - 1,
    for(x, 0, data at(y) size - 1,
      res set(y, x, get(x, y))))
  res)

m1 := Matrix dim(2, 3)
m1 println

m1 set(1, 0, 10)
m1 println

m1 get(1, 0) println

m2 := m1 transpose
m2 println


filename := "matrixdata.io"
file := File open(filename)
file write(m1 serialized())
file close

m3 := doFile(filename)
m3 println
