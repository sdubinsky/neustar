#!/usr/bin/ruby
require './category_counter'

def main
  if ARGV.empty?
    puts "Please enter a filename"
    exit(0)
  end
  begin
    counter = CategoryCounter.new ARGV[0]
    counter.print
  rescue => ex
    puts "Error: #{ex.message}\nPlease try again"
  end

end

main
