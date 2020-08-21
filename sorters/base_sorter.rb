require './sorters/direction/factory'

module Sorters
  class BaseSorter 

    attr_reader :order

    def initialize(order = 'desc')
      @order = Direction::Factory.build(order)
    end

    def sort(items)
      raise NotImplemented
    end
  end
end