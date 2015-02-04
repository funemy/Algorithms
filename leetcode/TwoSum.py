class Solution:
    # @return a tuple, (index1, index2)
    # using a hash table to solve the problem
    # and make time complexity stay in O(n)
    def twoSum(self, num, target):
        length = len(num)
        # dict in python is a hash table
        # key is the number
        # value is the index
        # remember the search time in a hash table is O(1)
        numMap = {}
        for i in range(0, length):
            key = target - num[i]
            # if the key has already been pushed into the table
            # then return the result tuple
            if key in numMap:
                return (numMap[key], i+1)
            # if the number we are looking for is not in the table, push it
            else:
                numMap[num[i]] = i+1

if __name__ == "__main__":
    alg = Solution()
    num = [0,4,3,0]
    target = 0
    print alg.twoSum(num, target)
