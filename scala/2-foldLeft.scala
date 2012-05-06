val list = List("one", "two", "three")
val sum = list.foldLeft(0) { (sum, s) => sum + s.length }
println(sum)

val sum2 = (0 /: list) { (sum, s) => sum + s.length }
println(sum2)
