require 'minitest/autorun'
require './download'

class DownloadfileTest < Minitest::Test
  def setup
  	@download=Downloadfile.new
    @download.downloadfile
  end  

  def test_is_file_downloaded
    assert File.exist?("/home/riya/project")
  end
end
