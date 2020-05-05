# Implement a linked list

# Done in Python

class Node():
  def __init__(self, data):
    self.data = data
    self.next = None

class LinkedList():
  def __init__(self, items=[]): # ["a"] -> ["b"] -> ["c"] -> None
    self.head = None
    self.tail = None
    
    for item in items:
      self.append(item)
      
  # append method
  def append(self, val):
    node = Node(val)
    # if empty add to the head, set the head and tail to the item
    if self.head is None:
      self.head = node
      self.tail = self.head
    # if not empty add to the end of the ll, then update the tail
    else:
      self.tail.next = node
      self.tail = self.tail.next


# Given a singly-linked list, find the middle value in the list.
# Example: If the given linked list is A → B → C → D → E, return C.
# Assumptions: The length (n) is odd so the linked list has a definite middle.

def findMiddleVal(L):
  # N = # of items in L
  # Space: O(N)
  # Time: O(N)
  items_array = [] # O(1)
  curr = L.head # O(1)
  # Traverse LL to convert LL to a regular array
  while curr != None: # O(N)
    items_array.append(curr.data) # O(1)
    curr = curr.next # O(1)
  
  # find middle index
  middle = len(items_array)//2 # O(1)
  # return middle value
  return items_array[middle] # O(1)
  
  
# Implement this with space O(1) --> no arrays, tuples, hashtables, anything
# brainstorm approaches:
  # Helper method find length --> O(N) time, O(1) space
    # Keep a counter and increment that at each iteration
    # counter will give us the length of the linked list
  # Calculate middle using helper method
  # Traverse with counter till you reach middle

def testFindMiddleVal():
  print("Testing linked list")
  L = LinkedList(["a", "b", "c"])
  
  assert(findMiddleVal(L) == "b")
  print("PASSED")
  
testFindMiddleVal()


  
  
