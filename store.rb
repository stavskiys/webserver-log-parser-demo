class Store

  attr_reader :items

  def initialize
    @items = {}
  end

  def add(row)
    page, ip = row.to_s.strip.split(' ')
    items[page] ||= Item.new(page)
    items[page].review(ip)
  end

  def display(sorter, formatter)
    sorter.sort(items.values).each do |item|
      STDOUT.puts formatter.format(item)
    end
  end

  class Item

    attr_reader :page, :visits

    def initialize(page)
      @page = page
      @ip_addresses = []
      @visits = 0
    end

    def review(ip)
      self.visits = visits + 1
      self.ip_addresses = ip_addresses + [ip] unless ip_addresses.include?(ip)
    end

    def uniq_views
      ip_addresses.size
    end

    private

    attr_accessor :ip_addresses
    attr_writer :visits
  end
end