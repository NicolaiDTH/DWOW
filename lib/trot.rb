# The Danny Dyer's Words of Wisdom
require 'csv'

def interactive_menu
	loop do print_menu
		process(STDIN.gets.strip)
	end
end

def print_menu
	puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	puts "Danny Dyer's Words of Wisdom"
	puts "created by Jamie, James, Roi & Nicolai"
	puts "--------------------------------------"
	puts "Instructions: Number. Word. Leave."
	puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	puts "A. Wisdom Innit (Word Input)"
	puts "B. Odd words'n'that (Random Phrase)"
	puts "C. Fak off (Exit)"
	puts "______________________________________"
end

def process(selection)
	case selection
	when "A", "a"
		wisdom_innit
	when "B", "b"
		puts odd_words
	when "C", "c"
		exit
	end
end	

def wisdom_innit
	puts "============="
	puts "Gimme a word."
	puts "============="
	wisdom = STDIN.gets.strip
	puts search(wisdom)
end

def dannys_wisdom
	@dannys_wisdom ||= []
end

def loads_dannys_wisdom_from(file)
	CSV.foreach(file) do |row|
		dannys_wisdom << row
	end
end

def search(keyword)
	dannys_wisdom.flatten.shuffle.select do |string|
		return string if string.include? keyword
	end
	"I'm not avin any of that. Leave it out."
end

def odd_words
	dannys_wisdom.flatten.shuffle.select do |string|
		return string
	end
end

loads_dannys_wisdom_from('./slags.csv')
interactive_menu