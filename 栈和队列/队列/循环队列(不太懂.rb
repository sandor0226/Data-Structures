class ParkingLot
    def initialize(capacity)
      @capacity = capacity  # 停车场容量
      @queue = Array.new(capacity)  # 初始化容量为 capacity 的数组
      @front = 0  # 队头下标
      @rear = 0  # 队尾下标
    end
  
    # 将车辆从某个入口进入停车场
    def enter(vehicle)
      if full?
        puts "停车场已满，无法进入。"
        return
      end
      @queue[@rear] = vehicle
      @rear = (@rear + 1) % @capacity  # 循环利用存储空间
      puts "#{vehicle} 进入停车场。"
    end
  
    # 将车辆从某个入口离开停车场
    def leave(vehicle)
      if empty?
        puts "停车场已空，无法离开。"
        return
      end
      index = @queue.index(vehicle)
      if index.nil?
        puts "#{vehicle} 不在停车场中。"
        return
      end
      @queue[index] = nil
      @front = (@front + 1) % @capacity  # 循环利用存储空间
      puts "#{vehicle} 离开停车场。"
    end
  
    # 获取队头元素
    def get_front
      @queue[@front]
    end
  
    # 获取队列长度
    def size
      (@rear - @front + @capacity) % @capacity
    end
  
    # 判断队列是否为空
    def empty?
      @front == @rear
    end
  
    # 判断队列是否已满
    def full?
      (@rear + 1) % @capacity == @front
    end
  end
  

parking_lot = ParkingLot.new(5)

parking_lot.enter("粤B12345")
parking_lot.enter("粤C67890")
parking_lot.enter("粤D24680")

puts "当前队头元素：#{parking_lot.get_front}"
puts "当前队列长度：#{parking_lot.size}"

parking_lot.leave("粤C67890")
parking_lot.leave("粤B12345")
parking_lot.enter("粤E13579")

puts "当前队头元素：#{parking_lot.get_front}"
puts "当前队列长度：#{parking_lot.size}"

parking_lot.enter("粤F24680")
parking_lot.enter("粤G13579")
parking_lot.enter("粤H24680")

puts "当前队头元素：#{parking_lot.get_front}"
puts "当前队列长度：#{parking_lot.size}"

parking_lot.enter("粤I13579")  # 停车场已满，无法进入。
