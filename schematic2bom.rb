#!/usr/bin/env ruby

# a simple Ruby script to extract the BOM from a KiCAD schematic
#
# usage: ./schematic2bom.rb <SCHEMATICFILENAME>

schematicfilename = ARGV[0]
schematic = File.open(schematicfilename, "r")
csvline = ""

schematic.each do |line|
	# create one CSV line per component
	if 0 == line.index("$Comp") then
		csvline = ""
	elsif 0 == line.index("$EndComp") then
		puts csvline.chop.chop
	end
	
	# F 4 "<FIELD CONTENT>" H 7350 2900 60  0001 C CNN "<FIELD NAME>"
	if 70 == line[0] then
		csvline = csvline + line.split("\"")[1] + ", "
		#csvline = csvline + line.split(" ")[10]
	end
end

schematic.close
