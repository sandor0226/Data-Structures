# 定义链表节点类
class Node
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end
end

# 定义单向链表类
class SinglyLinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  # 向链表末尾添加一个新元素
  def append(data)
    new_node = Node.new(data)

    # 如果链表为空，将新节点设为头节点
    if @head.nil?
      @head = new_node
    else
      # 否则，遍历链表，找到末尾节点
      current = @head
      current = current.next while current.next
      # 将新节点添加到末尾节点
      current.next = new_node
    end
  end

  # 遍历链表并打印所有元素
  def print_list
    current = @head
    while current
      puts current.data
      current = current.next
    end
  end
end

# 创建一个购物清单链表
shopping_list = SinglyLinkedList.new

# 向购物清单中添加商品
shopping_list.append("苹果")
shopping_list.append("香蕉")
shopping_list.append("葡萄")

# 打印购物清单
shopping_list.print_list
