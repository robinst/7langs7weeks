recursiveFib := method(
  n,
  if(n <= 1, n, recursiveFib(n - 1) + recursiveFib(n - 2)))

recursiveFib(1) println
recursiveFib(4) println


loopyFib := method(
  n,
  a := 0
  b := 1
  res := 1
  for(i, 2, n,
    res = a + b
    a = b
    b = res)
  res)

loopyFib(1) println
loopyFib(4) println
