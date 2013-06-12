require 'spec_helper'

describe ':Annotate' do
  before(:each) do
    # Invoke :Annotate
    vim.command('Annotate')
  end

  it 'creates contents directory with buffer full path (with "/" substituted by "%")' do
    File.directory?(File.join(@annotation_dir, @contents_dir)).should be_true
  end

  it 'opens an annotation file corresponding to current buffer and line no.' do
    buffer = vim.echo 'expand("%:p")'
    buffer.should eq File.join(@annotation_dir, @contents_dir, @cursor_line.to_s)
  end

  it 'sets annotation buffer filetype with g#annotator#annotation#filetype' do
    filetype = vim.echo '&filetype'
    filetype.should eq @annotation_filetype
  end
end
