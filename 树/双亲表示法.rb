class ParentTree
    def initialize(data)
      @data = data  # 存储节点信息的数组
      @parent = Array.new(data.size, -1)  # 存储父节点指针的数组
    end
  
    # 在树中添加一个新的节点
    def add_node(data, parent_index)
      node_index = @data.size  # 新节点的下标为数组的长度
      @data << data            # 在数组中添加新节点的信息
      @parent[node_index] = parent_index  # 设置新节点的父节点指针
  
      node_index  # 返回新节点的下标
    end
  
    # 获取树中指定下标的节点的父节点下标
    def parent_index(node_index)
      @parent[node_index]
    end
  
    # 获取树中指定下标的节点的信息
    def node_data(node_index)
      @data[node_index]
    end
end
  
# 创建一个树对象
tree = ParentTree.new(['A'])

# 添加一些节点
b_index = tree.add_node('B', 0)
c_index = tree.add_node('C', 0)
d_index = tree.add_node('D', 0)
e_index = tree.add_node('E', b_index)
f_index = tree.add_node('F', b_index)
g_index = tree.add_node('G', d_index)
h_index = tree.add_node('H', d_index)

# 通过双亲表示法，我们可以方便地存储和操作树的节点信息，包括添加节点、获取父节点下标和节点信息等。