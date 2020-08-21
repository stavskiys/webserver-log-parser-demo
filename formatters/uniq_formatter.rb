module Formatters
  class UniqFormatter < BaseFormatter

    def format(item)
      "#{item.page} #{item.uniq_views} uniq views"
    end
  end
end