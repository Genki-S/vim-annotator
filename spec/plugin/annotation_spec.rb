require 'spec_helper'

describe ':Annotate' do
  let(:annotation_dir) { "#{Dir.pwd}/.annotation" }
  let(:annotation_filetype) { 'markdown' }
  let(:file) { Tempfile.new('annotation') }
  let(:filename) { file.path }
  let(:contents_dir) { filename.gsub('/', '%') }

  before(:each) do
    # Set plugin options
    vim.let 'g:annotator#annotation#directory', annotation_dir
    vim.let 'g:annotator#annotation#filetype', annotation_filetype

    # Create Sandbox
    vim.edit!(filename)
    vim.insert('Hello, World.')

    # Invoke :Annotate
    vim.command('Annotate')
  end

  it 'creates contents directory with buffer full path (with "/" substituted by "%")' do
    File.directory?(File.join(annotation_dir, contents_dir)).should be_true
  end

  it 'opens an annotation file corresponding to current buffer and line no.' do
    buffer = vim.echo 'expand("%:p")'
    buffer.should eq File.join(annotation_dir, contents_dir, '1')
  end

  it 'sets annotation buffer filetype with g#annotator#annotation#filetype' do
    filetype = vim.echo '&filetype'
    filetype.should eq annotation_filetype
  end
end
