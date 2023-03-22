class SequentialString
    def initialize(str = "")
      @chars = str.chars
    end
  
    def to_s
      @chars.join
    end
  
    def length
      @chars.length
    end
  
    def [](index)
      @chars[index]
    end
  
    def []=(index, char)
      @chars[index] = char
    end
  
    def insert(index, char)
      @chars.insert(index, char)
    end
  
    def delete(index)
      @chars.delete_at(index)
    end
  end
  