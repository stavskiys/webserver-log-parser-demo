class DataExtractor

  attr_reader :full_file_path, :store

  def initialize(full_file_path, store)
    @full_file_path = full_file_path
    @store = store
  end

  def perform
    extract do |row|
      store.add(row)
    end
  end

  private

  def extract
    File.open(full_file_path, "r").each_line do |line|
      yield(line)
    end
  end
end