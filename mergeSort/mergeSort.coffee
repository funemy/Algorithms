a = [2,1,3,7,8,9,5,23,12,53,25,78,56,2,6]

mergeSort = (input) ->
	result = []
	length = input.length
	halfLength = Math.floor length/2
	former = input.slice(0,halfLength)
	later = input.slice(halfLength)
	if length > 2
		former = mergeSort(former)
		later = mergeSort(later)
	fp = 0
	lp = 0
	while former[fp] && later[lp]
		if former[fp] <= later[lp]
			result.push former[fp]
			fp++
		else
			result.push later[lp]
			lp++
	while former[fp]
		result.push former[fp]
		fp++
	while later[lp]
		result.push later[lp]
		lp++
	result

console.log mergeSort a
