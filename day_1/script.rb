# part one
# 
# TODO: refactor and make nicer, already answered correctly

# The list in inventory.txt represents the Calories of the food carried by all Elves

# Find the Elf carrying the most Calories. How many total Calories is that Elf carrying?

def inventory_greater_than_zero?(inventory)
	inventory.sum > 0
end

# read lines and process the txt file
parsed_and_formatted_inventories = File.readlines('inventory.txt', "\n\n").map{ |s| s.rstrip.split("\n") }

# convert all values in arrays into numbers
array_of_inventories = parsed_and_formatted_inventories.map { |inventory| inventory.map(&:to_i) }

# ensure all inventories total one or more
array_of_inventories.all? { |inventory| inventory_greater_than_zero?(inventory) }

# sum each array
array_of_inventories_by_size = array_of_inventories.map { |inventory| inventory.sum }

puts "Elf #{array_of_inventories_by_size.each_with_index.max[1]} is a chonker, carrying #{array_of_inventories_by_size.each_with_index.max[0]} calories"

# ******************************

# part two
#

# By the time you calculate the answer to the Elves' question, they've already realized that the Elf carrying the most Calories of food might eventually run out of snacks.

# To avoid this unacceptable situation, the Elves would instead like to know the total Calories carried by the top three Elves carrying the most Calories. That way, even if one of those Elves runs out of snacks, they still have two backups.

# Find the top three Elves carrying the most Calories. How many Calories are those Elves carrying in total?


# we should continue using +array_of_inventories_by_size+ to start

# show ascending
# puts array_of_inventories_by_size.sort

# show descending
array_of_inventories_by_size_descending = array_of_inventories_by_size.sort { |a, b| b <=> a }

top_three_inventories_by_size = array_of_inventories_by_size_descending.first(3)

top_three_inventories_total_calories = top_three_inventories_by_size.inject(&:+)

puts "The number of calories carried by the top three Elves totals #{top_three_inventories_total_calories}"