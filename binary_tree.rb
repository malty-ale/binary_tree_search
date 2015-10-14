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
    @tree = [@root]
    array.each do |i|
      @tree << new_node(i, @root)
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
  
  def breadth_first_search(target)
    queue = [@root]
    
    while !queue.empty?
      test = queue.shift
      
      return target if test.value == target
      
      queue << test.left_child if !test.left_child.nil?
      queue << test.right_child if !test.right_child.nil?
    end
    
    return nil
  end
  
  def depth_first_search(target)
    stack = [@root]
    results = [@root]
    
    while !stack.empty?
      test = stack[-1]
      puts results
      return target if test.value == target
      
      if (!test.left_child.nil? && !results.include?(test.left_child))
        stack << test.left_child
        results << test.left_child
      elsif (!test.right_child.nil? && !results.include?(test.right_child))
        stack << test.right_child
        results << test.right_child
      else
        stack.pop
      end
    end
    return nil
  end
end

a = Tree.new(10)
a.build_tree([5,3,7,4])
puts a.depth_first_search(7)