module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end
  
  module InstanceMethods   
    def read
      @csv_contents = []
      filename = self.class.to_s.downcase + '.txt'
      file = File.new(filename)
      @headers = file.gets.chomp.split(', ')

      file.each do |row|
        @csv_contents << row.chomp.split(', ')
      end
    end

    def each
      @csv_contents.each do |values|
        value_hash = Hash[@headers.zip(values)]
        yield CsvRow.new(value_hash)
      end
    end
    
    attr_accessor :headers, :csv_contents
    def initialize
      read 
    end
  end

  class CsvRow
    def initialize(value_hash)
      @value_hash = value_hash
    end

    def method_missing(name, *args)
      @value_hash[name.to_s]
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

cvs = RubyCsv.new
puts cvs.headers.inspect
puts cvs.csv_contents.inspect

cvs.each do |row|
  puts row.one
end
