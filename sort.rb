require 'csv'
require 'rubygems'
require 'zip'
require 'net/http'
require'./unzip'


class SortContents

    puts "SORTED LIST:::::::::::::::::::"
    def mergesort(list)
        return list if list.size <= 1
        mid   = list.size / 2
        left  = list[0, mid]
        right = list[mid, list.size]
        merge(mergesort(left), mergesort(right))
    end

    def merge(left, right)
        sorted = []
        until left.empty? || right.empty? do
            if left.first <= right.first
                sorted << left.shift
            else
                sorted << right.shift
            end
        end
        @y=sorted.concat(left).concat(right)
    end
    def writeFile
        File.open("temp","w") {|file| file.puts(@y)}
    end
end

