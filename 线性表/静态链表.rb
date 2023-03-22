# 定义静态链表类
class StaticLinkedList
    def initialize(size)
      @data = Array.new(size)  # 数组存放节点数据元素
      @next = Array.new(size)  # 数组存放节点后继节点在数组中的下标
      @head = -1  # 头节点指针
      @tail = -1  # 尾节点指针
    end
  
    # 在链表尾部添加一个元素
    def append(item)
      if @head == -1  # 如果链表为空，则将头节点和尾节点指向第一个节点
        @head = 0
        @tail = 0
        @data[0] = item
        @next[0] = -1
      else  # 如果链表不为空，则将尾节点指向新节点，并更新尾节点指针和尾节点的后继节点指针
        @data[@tail + 1] = item
        @next[@tail] = @tail + 1
        @next[@tail + 1] = -1
        @tail += 1
      end
    end
  
    # 在指定位置插入一个元素
    def insert(index, item)
      if index == 0  # 如果插入位置为0，则将新节点作为头节点，并更新头节点指针和新节点的后继节点指针
        @data[@head - 1] = item
        @next[@head - 1] = @head
        @head -= 1
      else  # 如果插入位置不为0，则找到前一个节点，将新节点插入到前一个节点之后，并更新前一个节点的后继节点指针和新节点的后继节点指针
        prev_index = get_index(index - 1)
        @data[prev_index + 1] = item
        @next[prev_index + 1] = @next[prev_index]
        @next[prev_index] = prev_index + 1
      end
    end
  
    # 删除指定位置的元素
    def delete(index)
      if index == 0  # 如果删除位置为0，则将头节点指针指向头节点的下一个节点
        @head = @next[@head]
      else  # 如果删除位置不为0，则找到前一个节点，将前一个节点的后继节点指针指向待删除节点的后继节点
        prev_index = get_index(index - 1)
        @next[prev_index] = @next[prev_index + 1]
      end
    end
  
    # 获取指定位置的元素
    def get(index)
      if index < 0 || index > length - 1  # 如果索引越界，则返回nil
        return nil
      else
        node_index = get_index(index)
        return @data[node_index]
      end
    end
    # 获取线性表的长度
    def length()
        count = 0
        node_index = @head
        while node_index != -1  # 遍历链表，统计节点数量
          count += 1
          node_index = @next[node_index]
        end
        return count
      end
    
      # 输出线性表的元素
      def display()
        node_index = @head
        while node_index != -1  # 遍历链表，输出每个节点的值
          print @data[node_index].to_s + " "
          node_index = @next[node_index]
        end
        puts ""
      end
    
      private
    
      # 根据索引获取节点在数组中的下标
      def get_index(index)
        node_index = @head
        index.times do
          node_index = @next[node_index]
        end
        return node_index
      end
end
    