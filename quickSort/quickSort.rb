intArr = []
File.open "QuickSort.txt", "r" do |file|
    while line = file.gets
        intArr.push line.to_i
    end
end

def quickSort(array, a, b, flag)
    if b >= a
        comparison = b - a
    else
        comparison = 0
    end
    if a < b
        s = partition(array,a,b, flag)
        comparison += quickSort(array, a, s-1, flag)
        comparison += quickSort(array, s+1, b, flag)
    end
    comparison
end

def partition(array, p, r, flag)
    if flag == "first"
        pivot = array[p]
    elsif flag == "last"
        array[p], array[r] = array[r], array[p]
        pivot = array[p]
    elsif flag == "mid"
        mid = ( p + r ) / 2
        max = [array[p], array[r], array[mid]].max
        min = [array[p], array[r], array[mid]].min
        if array[r] != max && array[r] != min
            array[p], array[r] = array[r], array[p]
        elsif array[mid] != max && array[mid] != min
            array[p], array[mid] = array[mid], array[p]
        end
        pivot = array[p]
        puts pivot
    end
    i = p
    (p+1).upto r do |j|
        if pivot > array[j]
            i += 1
            array[j], array[i] = array[i], array[j]
        end
    end
    array[p], array[i] = array[i], array[p]
    i
end

puts quickSort intArr, 0, 9999, "mid"
