#!/usr/bin/env ruby

# a simple Ruby script to extract the BOM from a KiCAD schematic

schematicfilename = ARGV[0]
schematic = File.open(schematicfilename, "r")
schematic.close
