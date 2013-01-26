all_text = LOAD 'kjvbible/in' USING PigStorage() AS (input_line:chararray);
 
-- Extract words from each line and put them into a pig bag
-- datatype, then flatten the bag to get one word on each row
words = FOREACH all_text GENERATE flatten(TOKENIZE(input_line)) AS word;
 
-- filter out any words that are just white spaces
filtered_words = FILTER words BY word matches '\\w+';
 
-- create a group for each word
word_groups = GROUP filtered_words BY word;
 
-- count the entries in each group
word_count = FOREACH word_groups GENERATE COUNT(filtered_words) AS COUNT, group;
 
-- order the records by count
ordered_word_count = ORDER word_count BY COUNT DESC, group;
STORE ordered_word_count INTO 'kjvbible/pig';
