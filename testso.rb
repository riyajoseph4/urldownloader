require 'minitest/autorun'
require './sort'


class SortTest< Minitest::Test
	def setup
	 @sort=SortContents.new
     @sort.mergesort($ar)
     @sort.writeFile
    end 

  def test_is_file_sorted
    assert File.exist?("/home/riya/project")
  end
end

