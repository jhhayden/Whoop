#!/usr/bin/env ruby
#
# fizzbuzz will print the numbers from 1 to 100
# if a number if a multiple of 3 it will print fizz instead
# if a number if a multiple of 5 it will print buzz instead
# if a number if a multiple of 15 it will print fizzbuzz instead
#
for i in 1..100
  print "i = "
  if i % 15 == 0
    puts "fizzbuzz"
  elsif i % 5 == 0
    puts "buzz"
  elsif i % 3 == 0
    puts "fizz"
  else
    puts "#{i}"
  end
end       
