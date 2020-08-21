require './tests/init'
require_relative '../sorters'

describe Sorters do
  let(:item1) { stub('item1', visits: 10, uniq_views: 1) }
  let(:item2) { stub('item2', visits: 8, uniq_views: 5)  }
  let(:item3) { stub('item3', visits: 6, uniq_views: 6)  }
  let(:items) { [item1, item2, item3] }
  let(:order) { 'desc' }

  describe Sorters::VisitsSorter do
    subject { Sorters::VisitsSorter.new(order).sort(items) }

    describe 'sort by desc' do
      it { assert_equal subject.first, item1 }
      it { assert_equal subject[1], item2 }
      it { assert_equal subject.last, item3 }
    end

    describe 'sort by asc' do
      let(:order) { 'asc' }
      it { assert_equal subject.first, item3 }
      it { assert_equal subject[1], item2 }
      it { assert_equal subject.last, item1 }
    end
  end

  describe Sorters::UniqSorter do
    subject { Sorters::UniqSorter.new(order).sort(items) }

    describe 'sort by desc' do
      it { assert_equal subject.first, item3 }
      it { assert_equal subject[1], item2 }
      it { assert_equal subject.last, item1 }
    end

    describe 'sort by asc' do
      let(:order) { 'asc' }
      it { assert_equal subject.first, item1 }
      it { assert_equal subject[1], item2 }
      it { assert_equal subject.last, item3 }
    end
  end
end