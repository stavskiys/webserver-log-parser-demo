require './tests/init'
require_relative '../command_args_parser'

describe CommandArgsParser do
  let(:file_path) { 'webserver.log' }
  let(:sorter_type) { nil }
  let(:cmd_args) { [file_path, sorter_type].compact }

  describe '#all' do
    let(:full_file_path_expect) { '/' + file_path }

    before do
      File.expects(:expand_path).returns('')
    end

    subject { CommandArgsParser.new(cmd_args).all }

    describe 'default - sorter not specified' do
      it 'full_file_path' do
        assert_equal subject[0], full_file_path_expect
      end
      it 'sorter instance' do
        assert_kind_of Sorters::VisitsSorter, subject[1]
      end
      it 'formatter instance' do
        assert_kind_of Formatters::SimpleFormatter, subject[2]
      end
    end

    describe 'by-uniq-views sorter' do 
      let(:sorter_type) { 'by-uniq-views' }
      it 'full_file_path' do
        assert_equal subject[0], full_file_path_expect
      end
      it 'sorter instance' do
        assert_kind_of Sorters::UniqSorter, subject[1]
      end
      it 'formatter instance' do
        assert_kind_of Formatters::UniqFormatter, subject[2]
      end
    end

    describe 'desc sorter' do
      let(:sorter_type) { 'by-views' }
      it 'full_file_path' do
        assert_equal subject[0], full_file_path_expect
      end
      it 'sorter instance' do
        assert_kind_of Sorters::VisitsSorter, subject[1]
      end
      it 'formatter instance' do
        assert_kind_of Formatters::SimpleFormatter, subject[2]
      end
    end

  end
end