
#Create a node class so each node knows what data it contains
class Node

attr_accessor :value, :left, :right

  def initialize(value)
    @value = value #Node's data
    @left = nil   #Node's child data
    @right = nil #Node's child data
  end

end

class BinaryTree

attr_accessor :root

  #Root instance variable
  def initialize
    @root = nil
  end

  # Maps out the array into a binary tree
  def build_tree(array)
    #Assign first value (at 0 index) as root node, shift removes the first element, so array is shorten by 1
    @root = Node.new(array.shift) if @root.nil?
    # Take each remaining element and make it into an object of class Node
    array.each do |element|
      node = Node.new(element)
      # call upon the insert method to map out the binary tree
      insert_node(node)
    end
  end

  #Creates a new node starting with comparison to root node
  def insert_node(new_node, current_node = @root)
  # Compares the new node value <= to root node value
    if new_node.value <= current_node.value
  # Checks if the current node left node is nil?
      if current_node.left.nil?
  #  If it is nil, then you create the new node in that spot
        current_node.left = new_node
      else
  # If it is not empty, then you need to go 1 step down to root.left
        insert_node(new_node, current_node.left)
      end
  # Since new node is > root node, check root.right if nil?
    elsif current_node.right.nil?
  # If true then you create a new node set  (root.right)= o new node.
      current_node.right = new_node
    else
  #Otherwise you need to move 1 step down to root.right
      insert_node(new_node, current_node.right)
    end
  end

#Uses a queue and takes the first element out
  def breadth_first_search(target)
    #Create an empty queue array
    queue = []
    #put root into queuee
    queue << @root
    #until the queue is empty:
    until queue.empty?
      #take the first value in (root) and set it to current node
      current_node = queue.shift
      # if the current node is = to target, then return it
      return current_node if current_node.value == target
      # else  put the left node into the queue unless it is nil
      queue << current_node.left unless current_node.left.nil?
      # put the right node into the queue unless it is nil
      queue << current_node.right unless current_node.right.nil?
    end
    #Return nil when it goes through all the node and doesn't find target
    nil
  end

#Same thing but uses a stack and takes the last element off
  def depth_first_search(target)
    stack = []
    stack << @root
    until stack.empty?
      current_node = stack.pop
      return current_node if current_node.value == target
      stack << current_node.left unless current_node.left.nil?
      stack << current_node.right unless current_node.right.nil?
    end
    nil
  end

  def dfs_rec(target, current_node = @root)
    stack = []
    stack << current_node
    until stack.empty?
      current_node = stack.pop
      return current_node if current_node.value == target
      dfs_rec(target, current_node.left) unless current_node.left.nil?
      dfs_rec(target, current_node.right) unless current_node.right.nil?
    end
  end
end

tree = BinaryTree.new
p array = [2,1,4,5,3]
p tree.build_tree(array)
#p tree.root.value               #=>2
#p tree.root.left.value          #=>1
#p tree.root.left.left           #=>nil
#p tree.root.left.right          #=>nil
#p tree.root.right.value         #=>4
#p tree.root.right.left.value    #=>3
#p tree.root.right.right.value   #=>5
#p tree.root.right.right.left    #=>nil
#p tree.root.right.right.right   #=>nil
#p tree.breadth_first_search(2)
#p tree.depth_first_search(2)
#p tree.dfs_rec(2)
