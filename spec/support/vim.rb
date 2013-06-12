module Support
  module Vim
    def set_file_contents(string)
      write_file(@filename, string)
      vim.edit(@filename)
    end

    def set_file_contents_with_line_numbers(num)
      set_file_contents((1..num).to_a.join("\n"))
    end
  end
end
