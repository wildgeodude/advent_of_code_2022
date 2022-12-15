# part one

def inventory_greater_than_zero?(inventory)
	inventory.sum > 0
end

# read lines and process the txt file
array_of_inventories = File.readlines('inventory.txt', "\n\n").map{ |s| s.rstrip.split("\n") }

# convert all values in arrays into numbers
array_of_inventories = array_of_inventories.map { |inventory| inventory.map(&:to_i) }

# ensure all inventories total one or more
array_of_inventories.all? { |inventory| inventory_greater_than_zero?(inventory) }

# sum each array
array_of_inventories = array_of_inventories.map { |inventory| inventory.sum }

puts "Elf #{array_of_inventories.each_with_index.max[1]} is a chonker, carrying #{array_of_inventories.each_with_index.max[0]} calories"
