class SupermarketCheckout
    def initialize
      @uqeue = []  # 顾客队列，初始化为空队列
    end
  
    # 将顾客加入队列的末尾
    def add_customer(customer)
      @queue.push(customer)
      puts "已加入队列：#{customer}"
    end
  
    # 从队列的头部取出一个顾客进行服务
    def serve_customer
      if @queue.empty?
        puts "队列已空，没有需要服务的顾客。"
        return
      end
      customer = @queue.shift
      puts "正在为顾客服务：#{customer}"
    end
  end
  
  checkout = SupermarketCheckout.new

checkout.add_customer("张三")
checkout.add_customer("李四")
checkout.add_customer("王五")

checkout.serve_customer  # 正在为顾客服务：张三
checkout.serve_customer  # 正在为顾客服务：李四
checkout.serve_customer  # 正在为顾客服务：王五
checkout.serve_customer  # 队列已空，没有需要服务的顾客。
