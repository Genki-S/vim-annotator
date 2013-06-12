require 'spec_helper'

describe ':AnnotationList' do
  before(:each) do
    @n_annotation = (1..@n_lines).to_a.sample
    # Annotate on lines
    (1..@n_lines).to_a.sample(@n_annotation).each do |line|
      vim.normal("#{line}G")
      vim.command("Annotate")
      vim.insert("Annotation on line #{line}.<CR>This is second line.")
      vim.command("wq")
    end
    vim.command('AnnotationList')
  end

  describe "location list" do
    before(:each) do
      @loclist = eval (vim.echo 'getloclist(0)').gsub(':', '=>')
    end

    it 'populates location list with all annotated lines' do
      @loclist.size.should eq @n_annotation
    end

    it 'sets first lines of the annotations to texts of location lists' do
      @loclist.each do |location|
        location['text'].should eq \
          get_annotation_contents_of_line(location['lnum']).lines.first.chomp
      end
    end
  end
end
