# Literals
Tuples: (1, 2, 3)
Lists: [1, 2, 3]
Dicts: {1: 'one', 2: 'two'}
Sets: {1, 2, 3}

""" 
@ TYPE
"""
# int, float, complex
# type annotation
# static type checker: mypy
from typing import List, Tuple, Dict
def annotation(name: str, id: int) -> List[int]:
    print(name)
    print(id)
    return [3,4]
 

""" 
@ NAMING 
"""
# keywords_, convention to break naming conflict
hash_
def_
class_
# _variable, weak internal use, from M import * will exclude
_id
# _function, private method
def _private_method(): 
    pass

""" 
@ SCOPE 
"""

# functions, classes, no block scope
# list comprehension, generator
def lexical_scoping(x):
    def adder(y):
        return x + y
    return adder
lexical_scoping(3)(4)
add3 = lexical_scoping(3)
add3(4) == 7

def global_var():
    global x
    print(x == True) # 10
x = 10

def unboundError():
    print(x == True) # Error
    x = 1
x = 10

# confusing 
# If there is an assignment to a variable inside a function, that variable is considered local.
i = 4
def foo(x):
    def bar():
        print(i, end=' ')
    for i in x:  # i *is* local to Foo, so this is what Bar sees
        print(i, end=' ')
    bar()
foo([1,2,3]) # 1 2 3 3

""" 
@ CLASS 
"""

class Test:
    def __init__(self, realpart, imagpart):
        pass

class ExtendedTest(Test):
    def __init__(self, realpart, imagpart):
        super().__init__()

    if __name__ == '__main__':
        pass

""" 
@ Functional Programming 
"""

add = lambda x, y: x + y
add(1, 2)

# Unpack argument list
def unpack(self, *args, **kwargs)
args = [1,5]
kwargs = {"a": 10, "b": 20}

# Map
list(map(add, [(1,2), (3,4)]))
# Filter
list(filter(lambda x: x < 0, range(-10, 10)))
# Reduce
from functools import reduce
product = reduce((lambda x, y: x * y), [1, 2, 3, 4])
# sum, min, max
sum(nums)

# zip
zipped = list(zip([1,2], [3,4])) # [(1,3), (2,4)]
unzipped = list(zip(*zipped)) #[(1,2), (3,4)]
for [a, b], c in zip([[1,2], [3,4]], [5,6]):
    print(a, b, c)

# enumerate
for idx, element in enumerate([4,3,2]):
    print(idx, element)


"""
@ File I/O
"""
fp = input() # read from stdin
with open(fp, 'r') as f:
    # data = f.readlines()
    data = f.read().split('\n')
    

with open(fp, 'w') as f:
    f.write(data)

"""
@ Special Usage
"""
# true if all conditions are satisfied
all(val < x for val in nums) 

# assume nums is sorted, insert val and maintain the sorted order
bisect.insort(nums, val) 

# print without newline
print(string, end = '')

if __name__ == '__main__':
    main()


# pretty print
from pprint import pprint 
pprint(string)

# Close SSL verification
import ssl
try:
    _create_unverified_https_context = ssl._create_unverified_context
except AttributeError:
    pass
else:
    ssl._create_default_https_context = _create_unverified_https_context

import requests
# Write this line before creating pyVmomi session
requests.packages.urllib3.disable_warnings()

# export PYTHONHTTPSVERIFY=0
# python your_script
# or
# PYTHONHTTPSVERIFY=0 python your_script
    

# HTTPS/URL Encoding
from urllib.parse import parse_url, parse_qs
url = 'amount=1000&merchant=123456789&destination[account]=111111&destination[amount]=877'
print(parse_qs(url))
