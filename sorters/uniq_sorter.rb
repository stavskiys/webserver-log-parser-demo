module Sorters
  class UniqSorter < BaseSorter
    def sort(items)
      items.sort { |a, b| order.compare(a.uniq_views, b.uniq_views) }
    end
  end
end