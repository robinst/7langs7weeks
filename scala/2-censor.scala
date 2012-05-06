object Censor {
  private val alternatives = Map("shoot" -> "pucky", "darn" -> "beans")
  private val pattern = """\w+""".r

  def censor(s: String): String = {
    pattern.replaceAllIn(s, m => alternatives.getOrElse(m.matched, m.matched))
  }
}

println(Censor.censor("This is a darn test. Oh shoot!"))
