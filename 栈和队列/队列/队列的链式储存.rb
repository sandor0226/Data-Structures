# 定义链表结点类
class Node
    attr_accessor :value, :next # 设置 value 和 next 两个属性的读写方法
  
    # 构造函数，传入结点的值，初始化结点的值和下一个结点指针为空
    def initialize(value)
      @value = value
      @next = nil
    end
  end
  
  # 定义队列类
  class Queue
    attr_accessor :head, :tail # 设置 head 和 tail 两个属性的读写方法
  
    # 构造函数，初始化队列的头和尾指针为空
    def initialize
      @head = nil
      @tail = nil
    end
  
    # 判断队列是否为空
    def empty?
      @head.nil?
    end
  
    # 入队操作，传入要插入的值
    def enqueue(value)
      node = Node.new(value) # 创建一个新的结点对象
  
      if empty? # 如果队列为空，则将队列的头和尾指针都指向新的结点
        @head = node
        @tail = node
      else # 如果队列不为空，则将尾结点的指针指向新的结点，并将队列的尾指针指向新的结点
        @tail.next = node
        @tail = node
      end
    end
  
    # 出队操作
    def dequeue
      if empty? # 如果队列为空，则抛出异常
        raise "Queue is empty"
      else # 如果队列不为空，则取出队头结点的值，并将队列的头指针指向下一个结点
        value = @head.value
        @head = @head.next
  
        if @head.nil? # 如果队头为空，则将队尾也置为空
          @tail = nil
        end
  
        return value # 返回取出的值
      end
    end
  end
  
  # 创建一个队列对象，并依次将 "A"、"B"、"C"、"D" 入队
  q = Queue.new
  q.enqueue("A")
  q.enqueue("B")
  q.enqueue("C")
  q.enqueue("D")
  
  # 依次出队并输出出队元素
  puts q.dequeue # 输出 "A"
  puts q.dequeue # 输出 "B"
  puts q.dequeue # 输出 "C"
  puts q.dequeue # 输出 "D"
  
  # 再次出队，此时队列为空，抛出异常
  puts q.dequeue # 抛出异常 "Queue is empty"
  