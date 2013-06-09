require 'spec_helper'

describe 'Annotation' do
  let(:annotation_dir) { "#{Dir.pwd}/.annotation" }

  before(:each) do
    # Set plugin options
    vim.let 'g:annotator#annotation#directory', annotation_dir
  end

  describe '#create_directory' do
    it 'creates directory with g:annotator#annotation#directory option' do
      File.directory?(annotation_dir).should be_true
    end
  end
end
