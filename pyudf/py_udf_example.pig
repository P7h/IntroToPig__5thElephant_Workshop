REGISTER /home/hduser/pig_workshop/pyudf.py USING jython AS udf;
records = LOAD 'pydata/in' USING PigStorage('\t') AS (input_line:chararray);
schema_records = FOREACH records GENERATE udf.split_into_fields(input_line);
DUMP schema_records; 

