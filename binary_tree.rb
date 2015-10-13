class Node
  attr_accessor :value, :parent, :left_child, :right_child
  
  def initialize(value, left_child = nil, right_child = nil)
    @value = value
  end
end

class Tree
  def initialize(root)
    @root = Node.new(root)
  end

  def build_tree(array)
    tree = [@root]
    array.each do |i|
      tree << new_node(i, @root)
    end
  end
  
  def new_node(value, parent)
    if value < parent.value
      if parent.left_child.nil?
        a = Node.new(value)
        parent.left_child = a
        a.parent = parent
        a
      else
        new_node(value, parent.left_child)
      end
    else
      if parent.right_child.nil?
        a = Node.new(value)
        parent.right_child = a
        a.parent = parent
        a
      else
        new_node(value, parent.right_child)
      end
    end
  end
end

a = Tree.new(10)
a.build_tree([5,3,7,4])