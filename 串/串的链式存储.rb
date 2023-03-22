class PersonName
    # 定义链表结点类
    class Node
      attr_accessor :char, :next
  
      def initialize(char, next_node = nil)
        @char = char
        @next = next_node
      end
    end
  
    # 初始化方法，创建一个新的链式字符串
    def initialize(name = "")
      @head = nil  # 头结点指针
      @tail = nil  # 尾结点指针
  
      # 将字符串中的每个字符添加到链表中
      name.chars.each do |char|
        append(char)
      end
    end
  
    # 将链表转换为字符串
    def to_s
      node = @head  # 当前结点指针
      result = ""   # 结果字符串
  
      while node
        result += node.char  # 将当前结点的字符添加到结果字符串中
        node = node.next     # 将当前结点指针移到下一个结点
      end
  
      result
    end
  
    # 获取链表中的字符个数
    def length
      node = @head  # 当前结点指针
      count = 0     # 字符个数
  
      while node
        count += 1  # 每遍历一个结点，字符个数加1
        node = node.next  # 将当前结点指针移到下一个结点
      end
  
      count
    end
  
    # 获取链表中特定位置的字符
    def [](index)
      node = node_at(index)  # 获取指定位置的结点
  
      if node
        node.char  # 返回该结点的字符
      else
        nil
      end
    end
  
    # 设置链表中特定位置的字符
    def []=(index, char)
      node = node_at(index)  # 获取指定位置的结点
  
      if node
        node.char = char  # 设置该结点的字符
      end
    end
  
    # 在链表的特定位置插入字符
    def insert(index, char)
      if index == 0  # 如果要插入到链表的开头，则使用 prepend 方法
        prepend(char)
      else
        prev_node = node_at(index - 1)  # 获取要插入位置的前一个结点
  
        if prev_node
          # 创建一个新的结点并插入到前一个结点的后面
          node = Node.new(char, prev_node.next)
          prev_node.next = node
        else
          # 如果要插入位置的前一个结点不存在，则将字符添加到链表的末尾
          append(char)
        end
      end
    end
  
    # 删除链表中特定位置的字符
    def delete(index)
      if index == 0  # 如果要删除链表的第一个字符，则使用 delete_first 方法
        delete_first
      else
        prev_node = node_at(index - 1)  # 获取要删除位置的前一个结点
  
        if prev_node && prev_node.next
          # 将前一个结点的指针指向要删除结点的下一个结点
          prev_node.next = prev_node.next.next
        end
      end
    end
  
    private
  
      # 获取链表中指定位置的结点
  def node_at(index)
    node = @head  # 当前结点指针

    while node && index > 0
      node = node.next  # 将当前结点指针移到下一个结点
      index -= 1        # 将 index 减 1
    end

    node  # 返回指定位置的结点
  end

  # 在链表的末尾添加一个字符
  def append(char)
    if @head.nil?  # 如果链表为空，则创建一个新的头结点
      @head = Node.new(char)
      @tail = @head
    else
      # 创建一个新的结点，并将其插入到链表的末尾
      node = Node.new(char)
      @tail.next = node
      @tail = node
    end
  end

  # 在链表的开头添加一个字符
  def prepend(char)
    node = Node.new(char, @head)  # 创建一个新的结点，并将其插入到链表的开头
    @head = node

    if @tail.nil?  # 如果链表为空，则更新尾结点指针
      @tail = node
    end
  end

  # 删除链表中的第一个字符
  def delete_first
    if @head  # 如果链表不为空，则将头结点指针指向下一个结点
      @head = @head.next

      if @head.nil?  # 如果链表只有一个结点，则将尾结点指针置为 nil
        @tail = nil
      end
    end
  end
end

  

  # 创建一个人名对象
name = PersonName.new("张三")

# 在名字的第一个字符后面插入一个新的字符
name.insert(1, "明")

# 获取名字的长度
puts "名字的长度是 #{name.length}"

# 删除名字的第二个字符
name.delete(1)

# 输出名字
puts "名字是 #{name}"
