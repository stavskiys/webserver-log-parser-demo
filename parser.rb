require 'pry'

$LOAD_PATH << Dir.pwd

require 'loader'

full_file_path, sorter, formatter = CommandArgsParser.new(ARGV).all

extractor = DataExtractor.new(full_file_path, Store.new)
extractor.perform

data_store = extractor.store 
data_store.display(sorter, formatter)






