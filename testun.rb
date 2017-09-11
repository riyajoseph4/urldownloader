require 'minitest/autorun'
require './unzip'


class Unzipfile < Minitest::Test
	def setup
  	 @unzip=Unzip.new
     @unzip.unzip_file("myfile", "/home/riya/project")
    end

    def test_is_file_unzipped
     assert File.exist?("/home/riya/project/top-1m.csv")
    end
end

