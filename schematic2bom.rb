#!/usr/bin/env ruby

# a simple Ruby script to extract the BOM from a KiCAD schematic
#
# usage: ./schematic2bom.rb <SCHEMATICFILENAME>

schematicfilename = ARGV[0]
schematic = File.open(schematicfilename, "r")

schematic.each do |line|
	# F 4 "<FIELD CONTENT>" H 7350 2900 60  0001 C CNN "<FIELD NAME>"
	if 70 == line[0] then
		puts line
	end
end

schematic.close
