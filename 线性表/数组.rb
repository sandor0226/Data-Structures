class List
    def initialize()
      @list = Array.new # 创建一个空数组
    end
  
    def append(item)
      @list.push(item) # 在数组尾部添加一个元素
    end
  
    def insert(index, item)
      @list.insert(index, item) # 在指定位置插入一个元素
    end
  
    def delete(index)
      @list.delete_at(index) # 删除指定位置的元素
    end
  
    def get(index)
      return @list[index] # 获取指定位置的元素
    end
  
    def length()
      return @list.length # 获取线性表的长度
    end
  
    def display()
      puts @list.inspect # 输出线性表的元素
    end
  end
  
  # 测试
  list = List.new()
  list.append(1)
  list.append(2)
  list.append(3)
  list.insert(1, 4)
  list.display()
  list.delete(2)
  list.display()
  puts list.get(1)
  puts list.length()
  