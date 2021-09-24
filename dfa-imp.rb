# Joshua Tozer
# CS 4700
# DFA Implementation
# 9/24/2021

table = []
temp_table = []
alphabet = []
lineNum = 0

f = File.open('DFA1.txt')
data = f.read
data.each_line(chomp: true) do |line|
	if lineNum == 0 then
		line.each_char do |c|
			alphabet += [c]
		end

	elsif lineNum == 1 then
		stateCount = line

	else
		line.each_char do |c|
			if c != ' '
				temp_table += [c]
			else

			end
		end
	end

	lineNum += 1
end

acceptState = temp_table.last

i = 0
j = 0
until j >= temp_table.length - 2 do
	table[i] = [temp_table[j], temp_table[j+1]]
	i += 1
	j += 2
end

puts "Enter input string: "
s = gets
s = s.strip

while s != "Done" do
	currentState = 0
	s.each_char do |c|
		puts 'Current state is ' + currentState.to_s + ' Current input char is ' + c
		if c == alphabet[0] then
			currentState = table[currentState.to_i][0]
		elsif c == alphabet[1] then
			currentState = table[currentState.to_i][1]
		end
		puts 'New state is ' + currentState.to_s
	end

	if currentState == acceptState then
		puts 'String ' + s + ' is accepted.'
	else
		puts 'String ' + s + ' is rejected.'
	end

	puts 'Enter a new input string or Done: '
	s = gets
	s = s.strip
end
