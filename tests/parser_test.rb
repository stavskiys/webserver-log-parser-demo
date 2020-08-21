require './tests/init'
require './loader'

describe 'Test Parser execution' do
  let(:store) do
    mock('store', display: nil)
  end

  before do
    CommandArgsParser.expects(:new).returns(mock('args', all: nil))
    DataExtractor.expects(:new).returns(mock('extractor', perform: true, store: store))
  end

  subject do
    load './parser.rb'
  end

  it { assert_equal subject, true }
end