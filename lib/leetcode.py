""" 
@ Redo again

https://www.lintcode.com/problem/window-sum/description
https://www.lintcode.com/problem/triangle-count/description
myPow

@ Review Later
https://www.jiuzhang.com/tutorial/segment-tree/237
https://www.jiuzhang.com/solution/strstr-ii/#tag-highlight-lang-python


"""

# TODO Pow(x, n)
# -1 // 2, special numerical operation handling
# see how others handle math problem
# deal with n < 2, e.g. n == -1 , n == 0

# TODO
# naming for max, min, hash, set, dict...
# max_, min_, maximum, minimum

# 

# NOTE 
# python + operator used when O(1)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
                                Corner Cases                
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
# BFS
while queue: continue

# DFS/BT/BST
if root is None: return None
if tree_node is not None: continue

# Linked List
if not head or not head.next: return None

                          
"""                             TYPE CHECKING 
value equal: ==, != 
reference equal: is, is not
False: 0, "", (), {}, [] or None
True: Others
Check false:
    if x is None: pass
    if x == 0: pass
    if x == []: pass
    if x == {}: pass
    if not input: pass
"""
# Logical Operator
and, or, not

# Numeric type
# Integers have unlimited precision.
import sys
sys.maxsize
-sys.maxsize-1

abs(x)
int(x)
float(x)
5 / 2 == 2.5
# The result is always rounded towards minus infinity: 
5//2 == 2
1//2 ==  0
(-1)//2 == -1 
1//(-2) == -1 
(-1)//(-2) == 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
                            SEQUENCE OPERATION 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
min(sequence)
max(sequence)
len(sequence)

# initialize sequence
[False] * 5 # 1D init
[[0] * 3 for _ in range(10)] # 2D init

# concat sequence
list1 + list2

# String
s.upper() 
s.lower()
s.replace("old", "new")
s.find("substring") # return index
"substring" in s # return boolean
s.isalpha()
s.isdigit()
s.split(",")
",".join(['first', 'second'])
ord('a') == 97
chr(97) == 'a'
# remove substring
str.strip("pattern")
# split
str.split(',')

# List
l.append(x) # equals to l[len(l):] = [x]
l.insert(i, x)
l.sort() # in-place
l.sort(reverse=True)
l.sort(key=lambda x: x[1])
l.index("element")

sorted(l) # iterable -> new list
sorted({1:'a', 2: 'b'}) == [1, 2] # collect keys O(N), sort O(NlogN)

# list comprehension
vec = [[1,2,3], [4,5,6], [7,8,9]]
[num for elem in vec for num in elem]

# reverse
nums = [1,2,3,4,5]
nums.reverse() # in-place
nums[::-1] # new object 
nums[:1:-2] == [5, 3] # first spot is infered as the last number


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
                            DATA STRUCTURE 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
# Stack [ ...  top]
stack = [1,2] # 
stack.append(3) # [1,2,3]
stack.pop()

# Queue [ enqueue ... dequeue]
from collections import deque
queue = deque([])
queue.append(3)
queue.popleft()

# Hash
hash = {}
hash = {x: 0 for x in range(10)}
len(hash)
hash[key] = 10
hash.get(key) # 10
hash.get(key, 20) # getOrDefault
del hash[key]
for k, v in hash.iteritems():
# Check hash contains key  
if dict_.get(key) is not None: pass
# Sequence (e.g. list, dict, tuple, str) Contains
if key in dict_: pass
if e not in list_: pass

# RBTree
from collections import OrderedDict
OrderedDict()

# Set
s = set()
s = set([1,2,3])
s.add(1)
s.discard(10)
x in s
len(s)

# Heap
from heapq import *
min_heap = []
heapify(min_heap) # O(N)
heappush(min_heap, element) # O(logN)
heappop(min_heap) # O(logN)
min_heap[0] # get smallest

max_heap = []
heappush(max_heap, -element)
-heappop(max_heap)
-max_heap[0] # get smallest

# LINKED LIST

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
                                BINARY SEARCH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
# OOOOO[O] [X]XXXXXX
# [1,1] find 1 inf loop if start < end
def bsearch(self, nums, target):
    if not nums: 
        return -1

    start, end = 0, len(nums) - 1
    while start + 1 < end;
        mid = (start + end) // 2
        if nums[mid] < target:
            start = mid
        elif nums[mid] > target:
            end = mid
        else:
            return mid

    if nums[start] == target:
        return start
    if nums[end] == target:
        return end
    return -1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
                                TWO POINTERS
main idea:
    swap with left or right when idx is not in the correct part
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""
TWO POINTERS -> <- 

unstable

1. qsort/qselect
2. two sum series
"""
# Two way partition : ... right | left  ... 
left, right = 0, len(nums) - 1
while left <= right:
    if nums[left] <= pivot: # quick sort use < pivot
        left += 1
    elif nums[right] > pivot: 
        right -= 1
    else:
        nums[left], nums[right] = nums[right], nums[left]
        left += 1
        right -= 1

"""
TWO POINTERS -> -> 

stable
1. Two way partition : ... | left  ... 
2. Sliding Window

"""
# left = 0
# for i in range(len(nums)):
    # # nums[i] is left part
    # if nums[i] < pivot:
        # nums[left], nums[i] = nums[i], nums[left] 
        # left += 1

# Two way partition: [ ... | left ... ] right 
left, right = 0, 0
while right < len(nums):
    # nums[right] is left part
    if nums[right] < pivot:
        nums[left], nums[right] = nums[right], nums[left]
        left += 1
    right += 1

# Three way partition: [ ... | left ... right | mid ... ]
left, mid, right = 0, 0, len(nums) - 1
while mid <= right:
    # nums[mid] is right part
    while mid <= right and nums[mid] > pivot:
        nums[mid], nums[right] = nums[right], nums[mid]
        right -= 1
    # nums[mid] is left part
    if nums[mid] < pivot:
        nums[mid], nums[left] = nums[left], nums[mid]
        left += 1
    mid += 1

# left, right = 0, len(nums) - 1
# for i in range(len(nums)):
    # if i > right:
        # break
    # while i <= right and nums[i] > pivot:
        # nums[i], nums[right] = nums[right], nums[i]
        # right -= 1
    # if nums[i] < pivot:
        # nums[i], nums[left] = nums[left], nums[i]
        # left += 1

# left, i, right = 0, 0, len(nums) - 1
# while i <= right:
    # if A[i] > pivot:
        # A[right], A[i] = A[i], A[right]
        # right -= 1
    # elif A[i] < pivot:
        # A[left], A[i] = A[i], A[left]
        # left += 1
        # i += 1
    # else:
        # i += 1

# QUICK SORT
"""
tricky part when encountering pivot value
nums[left] < pivot: left++
nums[right] > pivot: right--

1. avoid inf loop
if set <= pivot or >= pivot, then when one part 
is always <= pivot or >= pivot, divide and conquer
will divide them into [nums] [] and cause inf loop 

2. balance
can swap left pivot and right pivot to balance the split
, as the result, when [pivot pivot ... pivot],
it will be divided into two subarray and will not cause 
inf loop

each time it is done, 
right | left  or  right | pivot | left

"""
def qsort(self, nums, start, end):
    if start >= end:
        return
        # return nums[k], since partition finished

    pivot = nums[(start + end) // 2]

    left, right = start, end
    while left <= right: 
        if nums[left] < pivot:
            left += 1
        elif nums[right] > pivot:
            right -= 1
        else:
            nums[left], nums[right] = nums[right], nums[left]
            left += 1
            right -= 1

    # qsort  
    self.qsort(nums, start, left-1)
    self.qsort(nums, left, end)
 
    # qselect kth idx
    if k < left:
        return self.qselect(nums, start, left-1, k)
    else:
        return self.qselect(nums, left, end, k)

### Other Sorting
def bubble(nums):
    # nums[end] will be the largest in range(0, end+1)
    # From end - 1 to 1
    for end in range(len(nums)-1, 0, -1):
        # From 0 to end-1
        for i in range(end):
            if nums[i] > nums[i+1]:
                nums[i], nums[i+1] = nums[i+1], nums[i]

def insertion(nums):
    for end in range(1, len(nums)):
        i = end
        # optimized, less write operation 
        tmp = nums[i]
        while i > 0 and nums[i-1] > nums[i]:
            nums[i] = nums[i-1]
            i -= 1
        nums[i] = tmp

        # swap
        while i > 0 and nums[i-1] > nums[i]:
            nums[i-1], nums[i] = nums[i], nums[i-1]
            i -= 1

"""
TWO POINTERS <- ->  
"""
# Palindrome
left, right = middle, middle # odd
left, right = middle, middle + 1 # even
while low >= 0 and high < len(s) and s[low] == s[high]:
    low -= 1
    high += 1
return low >= high # True if palindrom


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
                                   BFS                               
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
from collections import deque
if not root: 
    return 0

""" 
TREE
""" 
# level = 0
queue = deque([root])
while queue:
    # level += 1
    for _ in range(len(queue)): # Level Order
        node = queue.popleft()
        '''
        Traverse here, do the operation
        '''
        if node.left:
            queue.append(node.left)
        if node.right:
            queue.append(node.right)

"""
UNDIRECTED GRAPH, need set
Valid Tree: 
    1. len(edges) == len(nodes) - 1
    2. len(visited) == len(nodes), one connected component  
"""
level = 0
queue = deque([root])
visited = set([root])
while queue:
    # level += 1
    for _ in range(len(queue)): # Level Order
        node = queue.popleft()
        for child in [node.left, node.right]:
            if child and child not in visited: # Check possible children
                queue.append(child)
                visited.add(child)
# has cycle
# if len(visited) != len(nodes)
 
"""
TOPOLOGICAL SORT (DAG)
"""
def topSort(graph):
    in_degree = {v: 0 for v in graph}
    for v in in_degree:
        for neighbor in v.neighbors:
            id_degree[neighbor] += 1

    # 1. check than one topo order
    # if len(queue) > 1
    queue = [v for v in in_degree if in_degree[v] == 0]
    order = []
    while queue:
        node = queue.popleft()
        order.append(node)
        for neighbor in node.neighbors:
            in_degree[neighbor] -= 1
            if in_degree[neighbor] == 0:
                queue.append(neighbor)

    # has cycle
    # for node in in_degree:
    #     if in_degree[node] != 0:
    #         return False
    return order

# Bidirectional BFS
# Given undirected graph, start and end, O(X ^ N) -> O(2 * X ^(N/2))

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
                                    DFS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

# BST, INORDER
class BSTIterator:
    """
    @param: root: The root of binary tree.
    """
    def __init__(self, root):
        self.stack = []
        while root != None:
            self.stack.append(root)
            root = root.left

    """
    @return: True if there has next node, or false
    """
    def hasNext(self):
        return len(self.stack) > 0

    """
    @return: return next node
    """
    def next(self):
        node = self.stack[-1]
        if node.right is not None:
            n = node.right
            while n != None:
                self.stack.append(n)
                n = n.left
        else:
            n = self.stack.pop()
            while self.stack and self.stack[-1].right == n:
                n = self.stack.pop()
        
        return node
