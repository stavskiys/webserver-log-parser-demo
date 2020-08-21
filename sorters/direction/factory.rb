require_relative './base_order'
require_relative './asc_order'
require_relative './desc_order'

module Sorters
  module Direction
    class Factory
      def self.build(order_type)
        case order_type.downcase
        when 'asc'
          AscOrder.new
        when 'desc'
          DescOrder.new
        else
          raise 'Order type does not support'
        end
      end
    end
  end
end