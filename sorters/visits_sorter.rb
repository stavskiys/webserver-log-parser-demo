module Sorters
  class VisitsSorter < BaseSorter

    def sort(items)
      items.sort { |a, b| order.compare(a.visits, b.visits) }
    end
  end
end