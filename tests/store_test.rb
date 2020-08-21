require './tests/init'
require_relative '../store'

describe Store do
  subject { Store.new }

  before { subject.add('page1 192.168.10.2') }

  describe '#add' do

    describe 'add the first page' do
      it 'contain one item'  do
        assert_equal subject.items.size, 1
      end
    end

    describe 'add the second page' do
      before do
        subject.add('page2 192.168.10.2')
      end
      it 'contain two items' do
        assert_equal subject.items.size, 2
      end
    end

    describe 'add the same page' do
      before { subject.add('page1 192.168.10.2') }
      it 'contain one item' do
        assert_equal subject.items.size, 1
      end
    end
  end

  describe '#display' do
    let(:sorter_stub) { mock('sorter stub')}
    let(:formatter_stub) { mock('formatter stub') }
    let(:items) { subject.items.values }

    before do
      STDOUT.expects(:puts).times(1)
      formatter_stub.expects(:format).returns('')
      sorter_stub.expects(:sort).with(items).returns(items)
    end

    it { subject.display(sorter_stub, formatter_stub) }
  end
end

describe Store::Item do
  let(:default_ip) { '192.168.10.10' }
  subject { Store::Item.new('test-page') }

  before { subject.review(default_ip) }

  describe 'page visited only once' do
    it { assert_equal subject.visits, 1 }  
    it { assert_equal subject.uniq_views, 1 }  
  end

  describe 'page visited two times by the same ip' do
    before  do
      subject.review(default_ip)
    end
    it { assert_equal subject.visits, 2 }
    it { assert_equal subject.uniq_views, 1 }
  end

  describe 'page visited few times by users with different ip' do
    let(:other_ip) { '192.168.48.52' }
    before do
      subject.review(default_ip)
      subject.review(other_ip)
    end
    it { assert_equal subject.visits, 3 }
    it { assert_equal subject.uniq_views, 2 }
  end
end