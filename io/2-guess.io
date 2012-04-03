main := method(
  number := Random value(0, 100) ceil
  i := 0
  correct := false
  previousDiff := nil
  while(i < 10 and correct == false,
    write("Please guess (1-100): ")
    guess := File standardInput readLine asNumber
    diff := (guess - number) abs
    if(previousDiff and diff != 0,
      if(diff < previousDiff,
        "hotter" println)
      if(diff > previousDiff,
        "colder" println))
    previousDiff = diff
    correct = guess == number
    i = i + 1)
  msg := if(correct,
    "You guessed correct!",
    "You guessed wrong, it was " ..  number)
  msg println
)

main
