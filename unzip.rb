require 'csv'
require 'rubygems'
require 'zip'
require 'net/http'
require'./download'

class Unzip
  def unzip_file (file, destination)
    Zip::File.open(file) do |zip_file|
      zip_file.each do |f|
          f_path = File.join(destination, f.name)
          FileUtils.mkdir_p(File.dirname(f_path))
          f.extract(f_path) unless File.exist?(f_path)
          @urls = f
      end
    end
    count = 1
    $ar=[]
    CSV.foreach(@urls) do |row| 
        $ar << row[1]
        count = count + 1
        if (count == 1000) 
            break
        end
    end
  end
end 
