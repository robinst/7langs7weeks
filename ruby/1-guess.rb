number = rand(10)
begin
  print "Guess number (0 to 9): "
  guess = gets.to_i
  if guess < number
    puts "Too low, guess again."
  elsif guess > number
    puts "Too high, guess again."
  else
    puts "Right!"
  end
end while guess != number
