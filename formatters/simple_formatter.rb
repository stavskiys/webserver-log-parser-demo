module Formatters
  class SimpleFormatter < BaseFormatter
    def format(item)
      "#{item.page} #{item.visits} visits"
    end
  end
end