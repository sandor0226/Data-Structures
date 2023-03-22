class Node
    attr_accessor :name, :task, :next_node
  
    def initialize(name, task)
      @name = name
      @task = task
      @next_node = nil
    end
  end
  
  class CircularLinkedList
    attr_accessor :head
  
    def initialize
      @head = nil
    end
  
    # 向链表添加元素
    def append(name, task)
        # 创建一个新的节点实例，包含家庭成员的名字和任务
        new_node = Node.new(name, task)
    
        # 如果链表为空（即头指针为nil）
        if @head.nil?
        # 将新节点设置为链表的头部
        @head = new_node
        # 将新节点的下一个节点指针设置为头部节点（即指向自身，形成一个循环）
        new_node.next_node = @head
        else
        # 如果链表不为空，设置一个临时指针，指向链表的头部节点
        current_node = @head
    
        # 遍历链表，直到找到最后一个节点（即指向头部节点的节点）
        while current_node.next_node != @head
            # 将临时指针设置为下一个节点
            current_node = current_node.next_node
        end
    
        # 将最后一个节点的下一个节点指针设置为新节点
        current_node.next_node = new_node
        # 将新节点的下一个节点指针设置为头部节点，形成循环
        new_node.next_node = @head
        end
    end
  
  
    def display
      current_node = @head
      if current_node.nil?
        puts "List is empty."
      else
        loop do
          puts "#{current_node.name} -> #{current_node.task}"
          current_node = current_node.next_node
          break if current_node == @head
        end
      end
    end
  end
  
  family_tasks = CircularLinkedList.new
  
  family_tasks.append("Alice", "Cooking")
  family_tasks.append("Bob", "Cleaning")
  family_tasks.append("Charlie", "Grocery shopping")
  family_tasks.append("Diana", "Laundry")
  
  family_tasks.display
  