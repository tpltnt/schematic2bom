#!/usr/bin/env ruby

# a simple Ruby script to extract the BOM from a KiCAD schematic
#
# usage: ./schematic2bom.rb <SCHEMATICFILENAME>

schematicfilename = ARGV[0]
schematic = File.open(schematicfilename, "r")

schematic.each do |line|
	puts line
end

schematic.close
