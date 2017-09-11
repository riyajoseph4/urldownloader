require 'minitest/autorun'
require './sort'
require './unzip'

class SortTest< Minitest::Test
	def setup
	 @sort=SortContents.new
     @sort.mergesort(['v','d'])
     @sort.writeFile
    end 

  def test_is_file_sorted
    assert File.exist?("/home/riya/project")
  end
end

