#!/usr/bin/python
# Filename - pyudf.py
@outputSchema("t:(first_name:chararray)")
def split_into_fields(input_line):
	if input_line!=None:
		fields = input_line.split()
		first_name = fields[0]
		return (first_name)
