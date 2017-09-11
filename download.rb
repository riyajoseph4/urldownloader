require 'csv'
require 'rubygems'
require 'zip'
require 'net/http'
class Downloadfile
    def downloadfile
        Net::HTTP.start("s3.amazonaws.com") do |http|
            content = http.get("http://s3.amazonaws.com/alexa-static/top-1m.csv.zip")
            File.open("myfile", "w") do |file|
                file.write(content.body)
            end
        end
        puts"downloaded"
        
    end
end

