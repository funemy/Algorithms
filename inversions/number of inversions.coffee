rf = require "fs"
intArr = rf.readFileSync 'IntegerArray.txt', 'binary'
intArr = intArr.split "\r\n"
intArr = for i in intArr
	parseInt(i)
intArr.pop()
result = []

mergeSort = (start, end) ->
	count = 0
	a = start
	b = end
	mid = Math.floor((a + b) / 2)
	if mid > a
		count += mergeSort(a, mid)
		count += mergeSort(mid+1, b)
	count += merge(a, mid, b)
	count

merge = (start, mid, end) ->
	count = 0
	a = start
	k = start
	b = mid + 1
	while a <= mid && b <= end
		if intArr[a] <= intArr[b]
			result[k] = intArr[a]
			a++
			k++
		else
			result[k] = intArr[b]
			count += b - k
			b++
			k++
	while a <= mid
		result[k] = intArr[a]
		a++
		k++
	while b <= end
		result[k] = intArr[b]
		b++
		k++
	for value, index in result
		if value
			intArr[index] = value
	console.log intArr
	count

console.log mergeSort(0, 99999)
#console.log result