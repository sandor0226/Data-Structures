class TextProcessor
    def initialize
      @text = ""
      @undo_stack = []
    end
  
    def add_text(text)
      # 将新文本添加到末尾，并将旧文本保存到撤销栈中
      @undo_stack.push(@text)
      @text += text
    end
  
    def delete_text
      if @text.length > 0
        # 将末尾字符删除，并将旧文本保存到撤销栈中
        @undo_stack.push(@text)
        @text.chop!
      else
        puts "Text is empty"
      end
    end
  
    def undo
      if @undo_stack.length > 0
        # 将最近保存的旧文本取出并恢复
        @text = @undo_stack.pop
      else
        puts "Undo stack is empty"
      end
    end
  
    def display
      puts "Current text: #{@text}"
    end
  end
  
  # 创建文字处理器实例
processor = TextProcessor.new

# 添加一些文本
processor.add_text("Hello, ")
processor.add_text("world!")

# 显示当前文本
processor.display  # "Current text: Hello, world!"

# 删除末尾字符
processor.delete_text

# 显示当前文本
processor.display  # "Current text: Hello, world"

# 撤销操作
processor.undo

# 显示当前文本
processor.display  # "Current text: Hello, world!"
