module Sorters
  module Direction
    class AscOrder < BaseOrder

      def compare(a, b)
        a <=> b
      end
    end
  end
end