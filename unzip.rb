require 'csv'
require 'rubygems'
require 'zip'
require 'net/http'
require './download'
require_relative 'create_file'

class UnzipFile
  def unzip_file (file, destination)
    Zip::File.open(file) do |zip_file|
      zip_file.each do |f|
          f_path = File.join(destination, f.name)
          FileUtils.mkdir_p(File.dirname(f_path))
          f.extract(f_path) unless File.exist?(f_path)
          @urls = f
      end
    end
    url="#{@urls}"
    count = 1
    @arraylist=[]
    CSV.foreach(url) do |row| 
        @arraylist << row[1]
        count = count + 1
        if (count == 1000) 
            break
        end
    end
  end
  def returnunzip
    return @arraylist
  end

end
@unzip=UnzipFile.new
@unzip.unzip_file("myfile","/home/riya/project")
@unzipList=@unzip.returnunzip

@write=Write_File.new
@write.writeFile('item',@unzipList)

