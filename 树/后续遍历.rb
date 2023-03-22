class TreeNode
    attr_accessor :val, :left, :right
    
    def initialize(val)
      @val = val
      @left = nil
      @right = nil
    end
  end
  
  def postorder_traversal(root)
    # 如果当前结点为空，返回空数组
    return [] if root.nil?
    
    result = []
    # 递归遍历左子树，将结果添加到数组中
    result += postorder_traversal(root.left) unless root.left.nil?
    # 递归遍历右子树，将结果添加到数组中
    result += postorder_traversal(root.right) unless root.right.nil?
    # 将当前结点的值添加到数组中
    result << root.val
    
    result
  end
  
  # 创建上述的二叉树
  root = TreeNode.new(4)
  root.left = TreeNode.new(2)
  root.left.left = TreeNode.new(1)
  root.left.right = TreeNode.new(3)
  root.right = TreeNode.new(6)
  root.right.right = TreeNode.new(5)
  
  # 输出后序遍历结果
  puts postorder_traversal(root) #=> [1, 3, 2, 5, 6, 4]
  
#   4
#   / \
#  2   6
# / \   
# 1   3  
#     \
#      5 
