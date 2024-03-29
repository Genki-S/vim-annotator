module Support
  module Vim
    def set_file_contents(string)
      write_file(@filename, string)
      vim.edit(@filename)
    end

    def set_file_contents_with_line_numbers(num)
      set_file_contents((1..num).to_a.join("\n"))
    end

    def annotation_filename_of_line(line)
      File.join(@annotation_dir, @contents_dir, line.to_s)
    end

    def get_annotation_contents_of_line(line)
      File.read(annotation_filename_of_line(line))
    end
  end
end
