# TODO Pow(x, n)
# -1 // 2, special numerical operation handling
# see how others handle math problem
# deal with n < 2, e.g. n == -1 , n == 0

### PYTHON  

# Comparison 
# == -> value equal
# is -> reference equal
if x: pass
if x != None: pass
if x is not None: pass

# False values
0, None, [], {}, ""

# Logical Operator
and, or, not

# zip
zipped = list(zip([1,2], [3,4])) # [(1,3), (2,4)]
unzipped = list(zip(*zipped)) #[(1,2), (3,4)]

# remove substring
str.strip("pattern")
# split
str.split(',')
# divide to integer
5 // 2 == 2
5 / 2 == 2.5

sys.maxsize

# Catch "", [] or None
input = "" 
if not input: return input
# Hash has key
if dict.get(key) is not None: 

# Literals
Tuples: (1, 2, 3)
Lists: [1, 2, 3]
Dicts: {1: 'one', 2: 'two'}
Sets: {1, 2, 3}

# Functional Programming
add = lambda x, y: x + y
add(1, 2)
# Map
list(map(add, [(1,2), (3,4)]))
# Filter
list(filter(lambda x: x < 0, range(-10, 10)))
# Reduce
from functools import reduce
product = reduce((lambda x, y: x * y), [1, 2, 3, 4])

def lexical_scoping(x):
    def adder(y):
        return x + y
    return adder
lexical_scoping(3)(4)
add3 = lexical_scoping(3)
add3(4) == 7

# confusing 
i = 4
def foo(x):
    def bar():
        print(i, end=' ')
    for i in x:  # i *is* local to Foo, so this is what Bar sees
        print(i, end=' ')
    bar()
foo([1,2,3]) # 1 2 3 3

# Unpack argument list
def unpack(self, *args, **kwargs)
args = [1,5]
kwargs = {"a": 10, "b": 20}

# String
s.upper() 
s.lower()
s.replace("old", "new")
s.find("substring")
s.isalpha()
s.isdigit()
s.split(",")
",".join(['first', 'second'])
ord('a') == 97

# List
l.append(x) # equals to l[len(l):] = [x]
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

# initialize
[False] * 5 # 1D init
[[0] * 3 for _ in range(10)] # 2D init

# concat
list1 + list2

# Stack [ ...  top]
stack = [1,2] # 
stack.append(3) # [1,2,3]
stack.pop()

# Queue [ enqueue ... dequeue]
queue = [1,2]
queue.insert(0, 3) # [3, 1, 2]
queue.pop() # [3, 1]

# Hash
hash = {}
hash[key] = 10
hash.get(key) # 10
hash.get(key, 20) # getOrDefault
del hash[key]
len(hash)
for k, v in hash.iteritems():

# RBTree
from collections import OrderedDict
OrderedDict()

# Set
s = set()
s.add(1)
s.discard(10)
x in s
len(s)

# BFS
if not root: 
    return 0
queue = [root]

while len(queue) > 0:
    num = len(queue)
    for i in range(num - 1, -1, -1):
        node = queue.pop()
        if node.left:
            queue.insert(0, node.left)
        if node.right:
            queue.insert(0, node.right)

# LINKED LIST

# BINARY TREE

# BINARY SEARCH

# [1,1] find 1 inf loop if start < end
def bsearch(self, nums, target):
    if not nums: 
        return -1
<<<<<<< HEAD
    start, end = 0, len(nums) - 1
=======
>>>>>>> a003b50ff733b3941dfb659552840fc5efa4bbc1

    start, end = 0, len(nums) - 1
    while start + 1 < end;
        mid = (start + end) // 2
        if nums[mid] < target:
            start = mid
        elif nums[mid] > target:
            end = mid
<<<<<<< HEAD
        else:
            return mid
=======
>>>>>>> a003b50ff733b3941dfb659552840fc5efa4bbc1

    if nums[start] == target:
        return start
    if nums[end] == target:
        return end
    return -1

# QUICK SORT

def qsort(self, nums, low, high):
    # import random
    # idx = random.choice(range(len(nums)))
    # nums[idx], nums[high] = nums[high], nums[idx]
    pivot = nums[(low+high)//2]

    mid = low
    for i in range(low, high):
        if nums[i] < pivot:
            nums[mid], nums[i] = nums[i], nums[mid]
            mid += 1

    nums[mid], nums[high] = nums[high], nums[mid]
    # qsort
    self.qsort(nums, low, mid - 1)
    self.qsort(nums, mid + 1, high)

    # qselect kth idx
    if k < mid:
        self.qselect(nums, low, mid - 1, k)
    elif k > mid:
        self.qselect(nums, mid + 1, high, k)
    else:
        return pivot


# Three way partitioning: small | low _ pivot _ high | large
i = low
while i <= high:
    while i <= high and nums[i] > nums[high]:
        nums[i], nums[high] = nums[high], nums[i]
        high -= 1
    # two way partition
    if nums[i] < nums[low]:
        nums[i], nums[low] = nums[low], nums[i]
        low += 1
    i += 1

# Palindrome

left, right = middle, middle # odd
left, right = middle, middle + 1 # even
while low >= 0 and high < len(s) and s[low] == s[high]:
    low -= 1
    high += 1
<<<<<<< HEAD
len = high - low - 1

# Bsearch
=======
return low >= high # True if palindrom
>>>>>>> a003b50ff733b3941dfb659552840fc5efa4bbc1
