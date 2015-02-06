class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def addTwoNumbers(self, l1, l2):
        lr = ListNode(0)
        lrtmp = lr
        tens = 0
        while l1 and l2:
            result = l1.val + l2.val + tens
            single = result % 10
            tens = result / 10
            if not lrtmp.val:
                lrtmp.val = single
                l1 = l1.next
                l2 = l2.next
                if not l1 and l2:
                    l1 = ListNode(0)
                elif not l2 and l1:
                    l2 = ListNode(0)
                elif not l1 and not l2 and tens:
                    l1 = ListNode(0)
                    l2 = ListNode(0)
                elif not l1 and not l2 and not tens:
                    return lr
                lrtmp.next = ListNode(0)
                lrtmp = lrtmp.next

if __name__ == "__main__":
    alg = Solution()
    l1 = ListNode(2)
    l1.next = ListNode(4)
    l1.next.next = ListNode(3)
    l2 = ListNode(5)
    l2.next = ListNode(6)
    l2.next.next = ListNode(4)
    l3 = alg.addTwoNumbers(l1, l2)
    print l3.val, '->', l3.next.val, '->', l3.next.next.val
