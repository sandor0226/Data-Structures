class TreeNode
    attr_accessor :val, :left, :right
    
    def initialize(val)
      @val = val
      @left = nil
      @right = nil
    end
  end
  
  def level_order_traversal(root)
    # 如果根结点为空，返回空数组
    return [] if root.nil?
    
    queue = [] # 定义一个队列
    queue << root # 将根结点入队列
    result = []
    
    # 循环遍历队列中的所有结点
    until queue.empty?
      node = queue.shift # 取出队列中的第一个结点
      result << node.val # 将当前结点的值添加到结果数组中
      queue << node.left unless node.left.nil? # 将当前结点的左子结点入队列
      queue << node.right unless node.right.nil? # 将当前结点的右子结点入队列
    end
    
    result
  end
  
  # 创建上述的二叉树
  root = TreeNode.new(4)
  root.left = TreeNode.new(2)
  root.left.left = TreeNode.new(1)
  root.left.right = TreeNode.new(3)
  root.right = TreeNode.new(6)
  root.right.right = TreeNode.new(5)
  
  # 输出层序遍历结果
  puts level_order_traversal(root) #=> [4, 2, 6, 1, 3, 5]
  