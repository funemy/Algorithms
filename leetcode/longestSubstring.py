class Solution:
# time limit exceeded
#     def lengthOfLongestSubstring(self, s):
        # total_len = len(s)
        # if total_len > 0:
            # sub_str = ""
            # result = []
            # index = 0
            # while index < total_len:
                # if s[index] not in sub_str:
                    # sub_str = sub_str + s[index]
                    # if index == total_len - 1:
                        # result.append(len(sub_str))
                    # index += 1
                # else:
                    # result.append(len(sub_str))
                    # current = s[index]
                    # while s[index-1] != current:
                        # index -= 1
                    # sub_str = s[index]
                    # index += 1
        # else:
            # return 0
        # return max(result)
    def lengthOfLongestSubstring(self, s):
        total_len = len(s)
        if total_len > 0:
            # start pointer
            sp = 0
            # end pointer
            ep = 0
            # characters that have already appeard
            # history is a hash table
            history = {}
            # the current max length of substring
            max = 0
            while ep < total_len:
                # if the character already appeard
                # move the start pointer
                if s[ep] in history:
                    if (ep - sp) > max:
                        max = ep - sp
                    # make sure the sp has been moved to the right most place
                    # that has no repeat characters
                    tmp = history[s[ep]] + 1
                    if tmp > sp:
                        sp = tmp
                    history[s[ep]] = ep
                    ep += 1
                else:
                    # store the first appeared characters in hash table
                    history[s[ep]] = ep
                    ep += 1
            # the last character
            if (ep -sp) > max:
                max = ep - sp
        else:
            return 0
        return max


if __name__ == "__main__":
    alg = Solution()
    string = "abba"
    print alg.lengthOfLongestSubstring(string)
