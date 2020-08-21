require './tests/init'
require_relative '../formatters'

describe Formatters do
  let(:item)  do 
    _item = mock('item')
    _item.stubs(:page).returns('test-page')
    _item.stubs(:visits).returns(10)
    _item.stubs(:uniq_views).returns(3)
    _item
  end

  describe Formatters::SimpleFormatter do
    subject { Formatters::SimpleFormatter.new }
    it 'apply interface of BaseFormatter' do
      assert_kind_of Formatters::BaseFormatter, subject
    end

    it '#format' do
      assert_equal subject.format(item), 'test-page 10 visits'
    end
  end

  describe Formatters::UniqFormatter do
    subject { Formatters::UniqFormatter.new }
    it 'apply interface of BaseFormatter' do
      assert_kind_of Formatters::BaseFormatter, subject
    end
    it '#format' do
      assert_equal subject.format(item), 'test-page 3 uniq views'
    end
  end
end