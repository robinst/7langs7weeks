trait Result
case class Win(winner: String) extends Result
case object Tie extends Result
case object Unfinished extends Result

val X = "X"
val O = "O"
val Empty = " "

class Board(val fields: String*) {
  require(fields.size == 9, "There must be exactly 9 fields.")
  require(fields.toSet.subsetOf(Set(X, O, Empty)), "Fields can only contain X, O or ' '.")

  def result: Result = {
    val rows = (0 until 9 by 3).map{ i => i until i + 3 }
    val cols = (0 until 3).map{ i => i until 9 by 3 }
    val diags = List(List(0, 4, 8), List(2, 4, 6))
    val all = rows ++ cols ++ diags
    val sets = all.map(valueSet)
    val winner = sets.find{ s => s == Set(X) || s == Set(O) }
    if (winner.isDefined) {
      Win(winner.get.head)
    } else {
      if (fields.exists{ f => f == Empty }) {
        Unfinished
      } else {
        Tie
      }
    }
  }

  private def valueSet(indices: Iterable[Int]): Set[String] = indices.map(fields).toSet
}

val board1 = new Board(
  "X", "X", "X",
  " ", " ", " ",
  " ", " ", " ")
println(board1.result)

val board2 = new Board(
  "X", "O", "X",
  " ", " ", " ",
  " ", " ", " ")
println(board2.result)

val board3 = new Board(
  "X", "O", "X",
  "X", "X", "O",
  "O", "X", "O")
println(board3.result)
