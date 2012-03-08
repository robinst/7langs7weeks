if ARGV.size != 2
  puts "usage: #{$0} pattern file"
  exit 64
end

pattern = ARGV[0]
filename = ARGV[1]

re = Regexp.new(pattern)

File.open(filename) do |file|
  file.each_with_index do |line, index|
    if re.match(line)
      number = index + 1
      puts "#{number}: #{line}"
    end
  end
end
