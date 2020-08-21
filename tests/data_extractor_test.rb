require './tests/init'
require_relative '../data_extractor'

describe DataExtractor do
  let(:store_stub) { MiniTest::Mock.new('store') }
  let(:full_file_path_example) { 'example/of/test/path' }

  subject { DataExtractor.new('example/of/test/path', store_stub) }

  it 'has read attrs with right values' do
    assert subject.full_file_path == 'example/of/test/path'
    assert subject.store == store_stub
  end

  describe '#perform' do
    let(:file_stub) do 
      _file_stub = StringIO.new
      _file_stub.puts '/test-page/1 192.168.1.21'
      _file_stub.puts '/other-info 192.168.22.11'
      _file_stub.string
    end
    before do
      store_stub.expects(:add).times(2)
      File.expects(:open).returns(file_stub)
    end

    it 'add items to store' do
      subject.perform
    end
  end
end