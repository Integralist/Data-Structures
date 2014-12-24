class Node
  attr_accessor :data, :pointer

  def initialize(data, pointer)
    @data    = data
    @pointer = pointer
  end
end

class List
  attr_reader :position

  def initialize
    @position = 1
  end

  def insert(item)
    (@head = Node.new(item, head)).tap do
      @current = head
    end
  end

  def remove(index)
    get(index-1).pointer = nil
  end

  def clear
    @position = 1
    @head = nil
  end

  def next
    @current = current.pointer
    @position = position + 1 unless current.nil?
  end

  def move_to(index)
    if index == 1
      hard_reset
    elsif index < position
      hard_reset
      enumerate_to index
    else
      enumerate_to index
    end
  end

  def get(index)
    counter = 1
    tmp = head

    until counter >= index  do
      counter += 1
      tmp = head.pointer
    end

    tmp
  end

  def front
    move_to 1
  end

  def end
    while next?
      self.next
    end
  end

  def next?
    current.pointer.nil? ? false : true
  end

  private

  attr_accessor :head, :current

  def hard_reset
    @current  = head
    @position = 1
  end

  def enumerate_to(index)
    while position < index
      self.next
    end
  end
end

require "pry";

list = List.new

p list.insert "a" # position 3
p list.insert "b" # position 2
p list.insert "c" # position 1

# ["c", "b", "a"]
# head == "c"
# current == "a" (as only set once if current == nil)

list.next
# position == 2
# current == "b"

list.remove 3
# ["c", "b"] (we're only deleting a reference to the Node)
# position == 2

list.clear
# We reset @head to nil meaning no references will be found
# Meaning they'll be garbage collected

list.insert "d"
list.insert "e"
# ["e", "d"]
# position == 1

list.move_to 2
p list.position
# position == 2

list.front
# current = "e"
# head = "e"
# position == 1

list.end
# current = "d"
# head = "e"
# position == 2
