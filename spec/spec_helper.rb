require 'vimrunner'
require 'vimrunner/rspec'
require 'tempfile'
require_relative 'support/vim'

Vimrunner::RSpec.configure do |config|
  # Use a single Vim instance for the test suite. Set to false to use an
  # instance per test (slower, but can be easier to manage).
  config.reuse_server = false

  # Decide how to start a Vim instance. In this block, an instance should be
  # spawned and set up with anything project-specific.
  config.start_vim do
    vim = Vimrunner.start_gvim

    # Setup your plugin in the Vim instance
    plugin_path = File.expand_path('../..', __FILE__)
    vim.add_plugin(plugin_path, 'plugin/vim-annotator.vim')

    def vim.let(var, val)
      val = "'#{val}'" if val.is_a? String
      command "let #{var}=#{val}"
    end

    # The returned value is the Client available in the tests.
    vim
  end
end

RSpec.configure do |config|
  config.include Support::Vim

  config.before(:each) do
    @annotation_dir = "#{Dir.pwd}/.annotation"
    @annotation_filetype = 'markdown'
    @filename = "#{Dir.pwd}/temp.txt"
    @contents_dir = @filename.gsub('/', '%')

    # Set plugin options
    vim.let 'g:annotator#annotation#directory', @annotation_dir
    vim.let 'g:annotator#annotation#filetype', @annotation_filetype

    # Create Sandbox
    set_file_contents_with_line_numbers(100)
  end
end
