# Data Structures

This is a repository of abstract data structures written in Ruby.

I do not attempt to make a canonical list of all different API variations or 
implementations across different languages. This repo provides the basic requirements 
to understand and implement these data structures using any language of your choosing.

The inspiration for this repo was acquired through the O'Reilly book: 
"Practical Data Structures and Algorithms using JavaScript". Although the basic 
information in the book was useful, it unfortunately suffered from quite a few 
code and syntax errors, as well as non-idiomatic (almost poor) JavaScript code.

Because of this, I decided to re-implement the data structures using my language 
of choice: Ruby. But please do read the book yourself as there is much more 
information presented there that I will not be replicating here. This repo is a 
mere outline of what the book teaches and I suggest you read the book for yourself.

What I've used from the book is: basic outline of the different data structure 
APIs along with a simple explanation of the data structure (indicated by a "quote" block). 
Otherwise all other information acquired and code implemented is my own.

- [Array](#array)
- [List](#list)
- [Stack](#stack)
- [Queue](#queue)
- [Dictionary](#dictionary)
- [Hash Table](#hash-table)
- [Set](#set)
- [Tree](#tree)

## Array

> An Array is a linear collection of elements,  
where the elements can be accessed via indices,  
which are usually integers used to compute offsets

Arrays are one of the more contentious data structures as they have a variety 
of different implementations, depending on the host language. For example, an 
Array has a specific "set-size" data structure (meaning it can't expand beyond 
its set dimensions and this might conflict with many reader's understanding of 
a typical Array), and this data structure can be the basis of other data structures 
such as Lists and Strings.

But what I have found in many languages is that the Array data structure is 
implemented using *other* data structures such as a Dictionary (or Object/Hash 
Table depending on your background), Linked List and even Search Trees.

JavaScript's implementation of an Array, for example, is actually an Object, 
where the numeric indices are converted into String keys.

The difference in implementations means that the properties of the data structure  
will change depending on the implementation. So in a classical sense an Array is 
a fixed size data structure, but in a language such as Ruby, PHP or JavaScript 
(for a small example) it is considered to be a "Dynamic Array", meaning the size 
can change and allow for additional elements to be added on to the Array. For the 
purposes of this repository I'll consider the definition that of a Dynamic Array.

### API

- `index` (return index of specified element)
- `pop` (remove last element)
- `push` (append new element)
- `shift` (remove first element)
- `unshift` (prepends new element)

### Non-standard API

- `slice!` (Remove specified index with optional length/range)
- `insert` (insert new elements at specified index)

> Note: we're using the Ruby programming language, but other languages can  
provide slightly different APIs. Such as JavaScript, whose API includes `slice`  
but not `insert` (instead it implements `splice`)

### Properties

- Sequential/Ordered (i.e. consistent element ordering based on collection population)
- Random access
- Element indices computed at run time
- Duplicates allowed

### Usefulness

Reference: [http://en.wikipedia.org/wiki/Dynamic_array#Performance](http://en.wikipedia.org/wiki/Dynamic_array#Performance)

#### Pros

- Faster lookups (due to index access, rather than looping entire data structure)
- Inserting/deleting elements at the end of the Array (due to index access)

#### Cons

- Inserting/deleting elements at the beginning/middle of the Array (due to all elements needing to be re-indexed)

### Notes

There is a mathematic variant of the Array called a [Vector](http://en.wikipedia.org/wiki/Vector_space) 
and you may be confused as to its use in the (Clojure programming language)[http://clojure.org/data_structures#Data Structures-Vectors (IPersistentVector)] but in practical 
terms they are implemented as a Dynamic Array data structure.

---

## List

A List is a simple collection of elements, which is different from an Array in 
that the elements within the List can only be accessed by looping through the 
entire list searching for the element of interest.

The List is made up of a collection of "nodes". Each node will hold:

- data for the current node
- pointer to the next node

This type of List is known as a Linked List, meaning each node is linked to the 
next node (hence there is no index access). The starting node is referred to as 
the "head" and then from the head you can loop iteratively through each node.

There are also different types of Linked List, the standard type is a "singly" 
Linked List, where by the last node's pointer will point to `null` (to indicate 
the end of the list). But there is also a "doubly" Linked List which allows each 
node's pointer to point to the *previous* node (not just point to the following node).

> Note: the following API is based on the "doubly" Linked List

There are also "circularly" Linked Lists which simply loop around and around the 
data structure (i.e. when it reaches the last node, the pointer will point 
to the starting node and vice-versa for the first node moving backwards).

### API

- `insert` (prepend new element or insert new element at specified index)
- `remove` (remove element at specified index)
- `clear` (remove all elements from the list, leaving an empty list)
- `next` (move to next item in the list)
- `prev` (move to previous item in the list)
- `move_to` (move to specified index)
- `position` (returns the current index position)
- `get` (returns the element at the specified index)
- `front` (change index position to be the starting position)
- `end` (change index position to be the ending position)
- `prev?` (returns Boolean value checking if a previous index exists)
- `next?` (returns Boolean value checking if a next index exists)

### Properties

- Sequential/Ordered (i.e. consistent element ordering based on collection population)
- Duplicates allowed

### Usefulness

Reference: [http://en.wikipedia.org/wiki/Dynamic_array#Performance](http://en.wikipedia.org/wiki/Dynamic_array#Performance)

#### Pros

- Inserting/deleting elements at the beginning of the Array (due to sequential iteration access)
- Better at inserting/deleting elements in the middle of the Array (although still requires search time)
- Useful if the order of your data doesn't matter (if it does then a Stack might be preferrable)
- Useful if you don't need to search your data in a performant manner

#### Cons

- Slower lookups (due to sequential iteration access, rather than having direct index access)
- Inserting/deleting elements at the end of the Array (due to sequential iteration access)
- Long searches or complex sorting can be a performance concern

---

## Stack

> A stack is a list of elements that are accessible only  
from one end of the list, which is called the `top`  
For example, the stack of trays at a cafeteria.  
Trays are always removed from the top,  
and when trays are put back on the stack after being washed,  
they are placed on the top of the stack

Because this data structure is LIFO (Last In, First Out) it means that you can 
only ever access the element that is on the top of the stack. If you want to 
access an element further down the stack then you'll need to remove the elements 
that currently sit above it.

The underlying implementation of the Stack will be an Array wrapped in an Object. 
This is because the Array by default provides the relevant `pop` and `push` methods 
(see API below).

An example of a Stack's usage could be determining a "Palindrome" (a word that 
is spelt the same forwards and backwards, like "dad"). You split the word into 
letters and store each letter into the stack and then process the stack (i.e. pop 
each element into an Array and then the Array should be the same as the Stack).

Example:

Stack -> `[h, e, l, l, o]` when `pop`'ed into an Array would look like `[o, l, l, e, h]` where we 
can see the word "hello" **isn't** a palindrome. But if we try again using the word "dad": 
`[d, a, d]`, we can see that you end up with a new Array `[d, a, d]` which **is** 
the same word.

### API

- `pop` (remove top element)
- `push` (append new element)
- `peek` (return the top element but don't `pop` it from the Stack)
- `clear` (remove all elements from the Stack, leaving an empty Stack)

### Properties

- Sequential/Ordered (i.e. consistent element ordering based on collection population)
- LIFO (Last In, First Out)

### Usefulness

- Useful when the order of your data matters
- Useful for searching the collection for specific data
- Fast (as Stacks only allows `push` and `pop` functionality)
- Used a lot in underlying language implementations (e.g. expression evaluation and handling function calls)

---

## Queue

> A queue is a type of list where data is  
inserted at the end and is removed from the front.  
Queues are used to store data in  
the order in which they occur, as opposed to a stack,  
in which the last piece of data entered  
is the first element used for processing

> Think of a queue like the line at your bank,  
where the first person into the line  
is the first person served,  
and as more customers enter a line,  
they wait in the back until it is their turn to be served

Luckily for us Ruby already implements a `Queue` class ([http://ruby-doc.org/stdlib-2.0.0/libdoc/thread/rdoc/Queue.html](http://ruby-doc.org/stdlib-2.0.0/libdoc/thread/rdoc/Queue.html)) 
although the API doesn't quite match up to the definition of what a Queue should 
implement. I've listed the correct API below and implemented by own Queue in 
the code samples, although I've had to name it differently so as not to clash 
with the official `Queue` class.

### API

- `enqueue` (append new element)
- `dequeue` (remove first element)
- `peek` (return the first element but don't `dequeue` it from the Queue)
- `clear` (remove all elements from the Queue, leaving an empty Queue)

### Properties

- Sequential/Ordered (i.e. consistent element ordering based on collection population)
- FIFO (First In, First Out)

### Usefulness

- Processing data that needs to be handled in a sequential order
- Can be useful for sorting data (depending on the sort)

### Notes

There are some situations where a Queue needs to be processed not in a FIFO 
sequence. This scenario is known as a "Priority Queue" and it works like this: 
elements are removed from the the Queue based on a priority *constraint*.

The way this would be implemented is by instead of storing raw data inside the 
Queue you would store Objects that contain the data along with a priority field. 
We would then redefined our `dequeue` method to loop through the Queue looking 
for the element with the highest priority and to process that. By nature of the 
basic implementation if we have multiple objects with the same priority then we
still continue to process elements on a FIFO basis (as we start looping from the 
start of the Queue).

---

## Dictionary

A Dictionary is simply a collection of key-value pairs. Any time we wish to 
retrieve content from the Dictionary we use the "key" to search for the content. 
When the key is found, the associated "value" is returned.

The following is an example of a basic Dictionary lookup in Ruby:

```ruby
dictionary = {
  :foo => "bar", 
  :baz => "qux"
}

dictionary[:foo] # => returns the value "bar"
```

### API

- `add` (takes a key and value as two separate arguments and adds them to the Dictionary)
- `find` (takes a key as a single argument and returns the associated value)
- `remove` (takes a key as a single argument and removes it, and its associated value, from the Dictionary)
- `all` (returns a custom display of all key-value pairs)

### Properties

- Unordered (i.e. random key ordering regardless of collection population)
- The `all` method should sort the keys (i.e. `dictionary.keys.sort`)

### Usefulness

#### Pros

- Fast insertion, deletion and retrieval

#### Cons

- Slow to search

### Notes

Some languages implement ordered key-value pairs (such as Ruby 1.9+) meaning 
that when enumerating over the Dictionary, the keys are read in the order they 
were inserted.

---

## Hash Table

A Hash Table is fundamentally an Dictionary data structure. The keys for the 
Dictionary are determined by a function that creates a hash of the key's 
associated data.

> Note: the hash algorithm can be anything you like  
the `hash_it` function defined below I just made up  
as it created a seemingly varied index based on each  
character byte from my data

Data | Hash Algorithm    | Hash Value
---- | ----------------- | ----------
Mark | `hash_it("Mark")` | 395
John | `hash_it("John")` | 399
Katy | `hash_it("Katy")` | 409
kraM | `hash_it("kraM")` | 395

```ruby
def hash_it(name)
  [].tap do |arr|
    name.each_byte { |b| arr << b }
  end.reduce(:+)
end
```

The "hash value" (as seen in the table matrix above) is the key we'll use to store 
our data under within our Dictionary. What you should also notice is there is a collision 
between our indices. The combination of the data "Mark" and "kraM" used with our 
particular algorithm has demonstrated that we have a collision that needs to be 
resolved somehow (we'll come back to this).

> Note: I'm using a Dictionary in this explanation  
but if your language's implementation of an Array  
allows any type of data for its indices then you  
should really use an Array instead.

### What data structure *should* I use?

For the purposes of the implementation code in this repo I've decided to use an 
Array and to make sure that, regardless of the data, my hashing algorithm generates 
a numerical value.

The reason for this is simply because the work around for collisions are centered 
around the data structure being an Array.

### Hashing algorithm

It's probably easier if I just quote from the book here:

> The choice of a hash function depends on the data type of the key.  
If your key is an integer, then the simplest hash function is  
to return the key modulo the size of the array.  
There are circumstances when this function is not recommended,  
such as when the keys all end in 0 and the array size is 10.  
This is one reason the array size should always be a prime number,  
such as 137

> Also, if the keys are random integers,  
then the hash function should more evenly distribute the keys.  
This type of hashing is known as modular hashing

> To avoid collisions, you first need to make sure the array  
you are using for the hash table is sized to a prime number.  
This is necessary due to the use of modular arithmetic in  
computing the key.  
The size of the array needs to be greater than 100 in order  
to more evenly disperse the keys in the table.  

In the above quote, they state they're using "modular arithmetic" for their 
algorithm. This means that the size of your Array data structure  will depend 
slightly on the hashing algorithm results and can only be decided upon after 
some experimentation.

### Hashing collisions

There are two popular techniques for resolving hashing collisions:

1. Separate Chaining
2. Linear Probing

#### Separate Chaining

Effectively our keys will hold a sub data structure and we use need a technique 
for storing our data into the sub array, allowing us to store the same hashed 
value key in the top level Dictionary.

The sub data structure you use could be another Dictionary or an Array, it depends 
on the technique you plan on using for storing the data within the sub data structure.

#### Linear Probing

This technique dictates that when a collision is found, the Hash Table will check 
to see if the next available index is empty and if so it'll place the data into 
that next index.

The idea behind this technique is that because Hash Table keys are generally quite 
distributed (e.g. they're rarely sequential 0, 1, 2, 3, 4) it's likely that you'll 
have many empty empty elements and you can use that empty space to store your 
colliding data. 

> Note: Linear Probing is suggested over Separate Chaining  
if your data structure is expected to be quite large

Personally I don't like the idea of the Linear Probing technique as it feels like 
it'll introduce more complexity and bugs. Also, there is a problem with this 
technique which is that it relies on the top level data structure being an Array. 
Which is fine if the key we're constructing is numerical, but if you want to have 
Strings for your keys then that wont work very well and so you'll need to be clever 
with how you implement this using a Dictionary.

### API

- `put` (takes "data" and passes it to our hashing function, then assigns the result to the Dictionary, returning the generated key)
- `get` (takes the hash value our data was assigned to and retrieves the data from the Dictionary)
- `all` (returns a custom display of our Dictionary, including the hash value keys)

---

## Set

A Set is simply a collection of unique values. 

### Terminology

- The elements of a Set are typically referred to as "members"
- A Set with no members is called an "empty" Set
- The Set itself is referred to as the "universe"

Multiple Sets are considered equal if they contain the same members.

A Set is considered a "subset" of another Set if all the members of the first Set 
are contained in the second Set.

### API

- `add` (appends new element)
- `remove` (removes specified element)
- `union` (returns a new Set combining the elements from two provided Sets)
- `intersection` (returns a new Set containing elements that exist in both provided Sets)
- `difference` (returns a new Set containing elements from the current Set that DON'T exist in the provided Set)
- `subset?` (returns a Boolean indicating whether the provided Set is a subset of the current Set)
- `show` (returns a custom display of the Set)

### Properties

- Unordered (i.e. random element ordering regardless of collection population)
- Unique list of elements (no duplicates)

### Usefulness

- Ensuring a collection of unique data

---

## Tree

A Tree data structure is used to store hierarchical data (it is non-linear), 
such as an Operating System file system.

A Tree contains "nodes" (a node has a value associated with it) and each node is 
connected by a line called an "edge". These lines represent the relationship 
between the nodes.

The top level node is known as the "root" and a node with no children is a "leaf".

If a node is connected to other nodes, then the preceeding node is referred to 
as the "parent" and nodes following it are "child" nodes.

### Binary Trees

There is a specific type of tree referred to as a "Binary Tree", which restricts 
its child nodes to no more than two.

The children of a node are referred to as the "left" node and the "right" node.

When creating a Binary Tree object you'll pass in the first node to become the 
root node and each node is itself an object with an associated value, along with 
a left and right node linked to.

### Binary Search Trees

There is another type of tree called a "Binary Search Tree" and this is an 
extension of the Binary Tree, with the addition that the child nodes are stored 
in a specific order depending on a custom calculation.

The calculation is very simple: if a node has a lesser value than its parent it 
is placed in the "left" node position. If on the other hand it has a greater value 
than its parent it is placed in the "right" node position.

### API

- `insert` (adds new node to the tree; which can require traversal of the tree)
- `in_order` (traversal method: visits all nodes in ascending order†),
- `pre_order` (traversal method: same as `in_order` but prints the current node *before* checking the left/right child nodes)
- `post_order` (traversal method: same as `in_order` but prints the current node *after* checking the left/right child nodes)
- `show` (display the current node's value)

> Note: traversal methods rely on recursion  
and need to be carefully implemented to ensure  
they do not cause a Stack Overflow error

#### † `in_order`

The `in_order` function would theorectically look something like:

```ruby
def in_order(node)
  unless node.nil?
    in_order node.left
    puts node.show
    in_order node.right
  end
end
```

Now imagine we have the following Binary Search Tree structure:

```
     23
     |
   -------
   |     |
  16     45
  |      |
 ----   ----
 |  |   |  |
03  22  37 99
```

If we executed `in_order(23)` we would see the following output:

`3 16 22 23 37 45 99`

This is how it works...

If we passed in the root node (23) to `in_order` then that function would check 
if the root node had a value and if it did it would check to see if it had a left 
child node (which it does: 16). 

Through recursion the function would check if that node had value (it does: 16) 
and then check if itself had a left child node (it does: 03).

From there it would check if the `03` node had a left child node (it doesn't). 
So it would fail the check for `nil?` and move back up the function call stack
print `03` (using the `node.show` function) and then see if the `03` node had a 
right value (it doesn't).

Now the code again moves back up the function call stack and print `16` and now 
check if the node `16` has a right node (it does: 22).

Does `22` have a value, yes so see if it has a left node (it doesnt), so move 
back up the function call stack and print `22` and now check if it has a right 
node (it doesn't) so again move up the function call stack and that takes us 
back to the root node `23` which we print and see if that has a right node 
(it does: 45)... and so forth until the end.

#### Function Output

Inorder traversal:  
3 16 22 23 37 45 99

Preorder traversal:  
23 16 3 22 45 37 99

Postorder traversal:  
3 22 16 37 99 45 23

### Properties

- No direct access to nodes (start from the head/root and navigate down)

### Usefulness

- Quick to search
- Quick insertion/deletion
