module Sorters
  module Direction
    class DescOrder < BaseOrder

      def compare(a, b)
        b <=> a
      end
    end
  end
end