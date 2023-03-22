# 定义一个节点类，每个节点包含一个值和指向下一个节点的指针
class Node
    attr_accessor :value, :next_node
  
    def initialize(value)
      @value = value
      @next_node = nil
    end
  end
  
  # 定义一个链式结构的线性表类
  class LinkedList
    def initialize()
      @head = nil  # 头节点指针
      @tail = nil  # 尾节点指针
    end
  
    # 在链表尾部添加一个元素
    def append(item)
      node = Node.new(item)  # 创建一个新节点
      if @head.nil?  # 如果链表为空，则将头节点和尾节点指向新节点
        @head = node
        @tail = node
      else  # 如果链表不为空，则将尾节点指向新节点，并更新尾节点指针
        @tail.next_node = node
        @tail = node
      end
    end
  
    # 在指定位置插入一个元素
    def insert(index, item)
      node = Node.new(item)  # 创建一个新节点
      if index == 0  # 如果插入位置为0，则将新节点作为头节点，并更新头节点指针
        node.next_node = @head
        @head = node
      else  # 如果插入位置不为0，则找到前一个节点，将新节点插入到前一个节点之后，并更新前一个节点指针和尾节点指针（如果需要）
        prev_node = get_node(index - 1)
        node.next_node = prev_node.next_node
        prev_node.next_node = node
        if prev_node.next_node.nil?
          @tail = prev_node
        end
      end
    end
  
    # 删除指定位置的元素
    def delete(index)
      if index == 0  # 如果删除位置为0，则将头节点指针指向头节点的下一个节点
        @head = @head.next_node
      else  # 如果删除位置不为0，则找到前一个节点，将前一个节点指针指向待删除节点的下一个节点，并更新尾节点指针（如果需要）
        prev_node = get_node(index - 1)
        prev_node.next_node = prev_node.next_node.next_node
        if prev_node.next_node.nil?
          @tail = prev_node
        end
      end
    end
  
    # 获取指定位置的元素
    def get(index)
      node = get_node(index)  # 获取指定位置的节点
      if node.nil?  # 如果节点不存在，则返回nil
        return nil
      else  # 如果节点存在，则返回节点的值
        return node.value
      end
    end
  
    # 获取线性表的长度
    def length()
      count = 0
      node = @head
      while node != nil  # 遍历链表，统计节点数量
        count += 1
        node = node.next_node
      end
      return count
    end
  
    # 输出线性表的元素
    def display()
      node = @head
      while node != nil  # 遍历链表，输出每个节点的值
        print node.value.to_s + " "
        node = node.next_node
      end
      puts ""
    end
  