#!/usr/bin/env ruby

# a simple Ruby script to extract the BOM from a KiCAD schematic
#
# be warned, this script is *very* optimistic about the running conditions
#
# usage: ./schematic2bom.rb <SCHEMATICFILENAME>

schematicfilename = ARGV[0]
schematic = File.open(schematicfilename, "r")
csvfilefilename = schematicfilename[0..schematicfilename.length-4] + "csv"
csvfile = File.open(csvfilefilename, "w")
csvline = ""

schematic.each do |line|
	# create one CSV line per component
	if 0 == line.index("$Comp") then
		csvline = ""
	elsif 0 == line.index("$EndComp") then
		# remove last seperator + space and write it into the output file
		csvfile.puts csvline.chop.chop
	end

	# split the string at all "s and only add the field content
	# F 4 "<FIELD CONTENT>" H 7350 2900 60  0001 C CNN "<FIELD NAME>"
	if 70 == line[0] then
		csvline = csvline + line.split("\"")[1] + "; "
	end
end

schematic.close
csvfile.close
