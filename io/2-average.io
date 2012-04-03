List myAverage := method(
  sum := self sum
  len := self size
  sum / len)

list(1, 2, 3) myAverage println
// Results in Exception: nil does not respond to '/'
// list() myAverage println
