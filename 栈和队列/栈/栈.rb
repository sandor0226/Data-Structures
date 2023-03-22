class Stack
    def initialize
      @elements = []
    end
  
    def push(element)
      @elements.push(element)
    end
  
    def pop
      raise "栈为空，无法弹出元素" if empty?
      @elements.pop
    end
  
    def peek
      @elements.last
    end
  
    def empty?
      @elements.empty?
    end
  
    def size
      @elements.size
    end
  end
  
  # 创建一个新的栈
  stack_of_plates = Stack.new
  
  # 向栈中添加盘子
  stack_of_plates.push("盘子1")
  stack_of_plates.push("盘子2")
  stack_of_plates.push("盘子3")
  
  # 查看栈顶的盘子
  puts "栈顶的盘子是: #{stack_of_plates.peek}"
  
  # 从栈中取出一个盘子
  top_plate = stack_of_plates.pop
  puts "取出的盘子是: #{top_plate}"
  
  # 查看栈的大小
  puts "栈的大小是: #{stack_of_plates.size}"
  