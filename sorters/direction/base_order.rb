module Sorters
  module Direction
    class BaseOrder
      def compare
        raise NotImplemented
      end
    end
  end
end