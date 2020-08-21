require 'formatters'
require 'sorters'

class CommandArgsParser

  attr_reader :full_file_path, :sorter_type

  def initialize(args)
    @full_file_path = File.expand_path(File.dirname(args.first)) + "/" + args.first.to_s
    @sorter_type = args.last
  end

  def all
    [full_file_path].concat(sorter_and_formatter)
  end

  private

  def sorter_and_formatter
    case sorter_type
    when 'by-uniq-views'
      [Sorters::UniqSorter.new, Formatters::UniqFormatter.new]
    else 'by-views'
      [Sorters::VisitsSorter.new, Formatters::SimpleFormatter.new]
    end
  end

end