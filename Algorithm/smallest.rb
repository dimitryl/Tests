# encoding: UTF-8
# accept the lizt from the passed argument or usage method
unless ARGV.length == 1
	p "Usage: smallest.rb [list of integers]"
	print "\teg: smallest.rb \"8, 23, 9, 0, 12, 11, 1, 10, 13, 7, 41, 4, 14, 21, 5, 17, 3, 19, 2, 6\""
	exit
end 

# convert the string to list
list = ARGV[0].split(',').to_a.collect { |x| x.to_i }
if list.empty?
	p "The list provided is empty or it was invalid"
	exit
end

i = 0
while list.include?(i)
	i += 1
end

p 'Smallest int is: ' + i.to_s