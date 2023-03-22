class Node
    attr_accessor :data, :next
  
    def initialize(data)
      @data = data
      @next = nil
    end
  end
  
  class Stack
    def initialize
      @top = nil
    end
  
    def push(data)
      # 创建新节点
      new_node = Node.new(data)
  
      # 如果栈为空，则新节点为栈顶节点
      if @top.nil?
        @top = new_node
      else
        # 将新节点插入到栈顶
        new_node.next = @top
        @top = new_node
      end
    end
  
    def pop
      if @top.nil?
        puts "Stack is empty"
      else
        # 取出栈顶节点并返回数据
        data = @top.data
        @top = @top.next
        return data
      end
    end
  
    def empty?
      return @top.nil?
    end
  
    def top
      if @top.nil?
        puts "Stack is empty"
      else
        return @top.data
      end
    end
  end
  