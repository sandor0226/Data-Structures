class BinaryTreeNode
    attr_accessor :value, :left_child, :right_child
  
    def initialize(value, left_child = nil, right_child = nil)
      @value = value
      @left_child = left_child
      @right_child = right_child
    end
  
    # 前序遍历
    def pre_order_traversal
      # 如果当前节点为空，则返回一个空数组
      return [] if self.nil?
  
      # 初始化结果数组和栈
      result = []
      stack = [self]
  
      # 遍历栈，直到栈为空
      until stack.empty?
        # 弹出栈顶节点
        node = stack.pop
  
        # 将节点的值加入到结果数组中
        result << node.value
  
        # 如果节点的右子节点不为空，则将其右子节点入栈
        stack << node.right_child unless node.right_child.nil?
  
        # 如果节点的左子节点不为空，则将其左子节点入栈
        stack << node.left_child unless node.left_child.nil?
      end
  
      # 返回结果数组
      result
    end
  end
  