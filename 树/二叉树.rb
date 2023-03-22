class BinaryTreeNode
    attr_accessor :value, :left_child, :right_child
  
    def initialize(value, left_child = nil, right_child = nil)
      @value = value
      @left_child = left_child
      @right_child = right_child
    end
  end
  
  # 创建一个二叉树
root = BinaryTreeNode.new('A')
root.left_child = BinaryTreeNode.new('B')
root.right_child = BinaryTreeNode.new('C')
root.left_child.left_child = BinaryTreeNode.new('D')
root.left_child.right_child = BinaryTreeNode.new('E')
root.right_child.right_child = BinaryTreeNode.new('F')
