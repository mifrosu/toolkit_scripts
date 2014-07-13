#!/usr/bin/env ruby

# This script writes lines in file 2 that are not present in file 1 
# to a file in /tmp

OUTFILE = "/tmp/subtracted.csv"


def process_argv
  if ARGV.size != 2
    puts "ARGV.size is #{ARGV.count}"
    puts "#{ARGV}"
    puts "Usage: #{$0} file_1.csv file_2.csv"
    exit
  end
end

def read_array(filename, line_array)
  File.readlines(filename).each do |line|
    line_array.push(line)
  end if File.exists?(filename)
end

def write_out(lines_array)
  File.open(OUTFILE, 'w') do |f|
    lines_array.each do |line|
      f.puts line
    end
    puts "(#{ARGV[0]} - #{ARGV[1]}) written to #{OUTFILE}."
  end
end

if __FILE__ == $0
  process_argv
  lines_0, lines_1 = [], []
  read_array(ARGV[0], lines_0)
  read_array(ARGV[1], lines_1)
  if lines_0.size.zero? || lines_1.size.zero?
    puts "Nothing to write: One of the supplied files was empty."
  else
    write_out(lines_0 - lines_1)
  end
end




