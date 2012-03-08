numbers = (1..16).to_a

line = []
numbers.each do |n|
  line << n
  if line.size == 4
    puts line.join(" ")
    line = []
  end
end

numbers.each_slice(4) do |line|
  puts line.join(" ")
end
