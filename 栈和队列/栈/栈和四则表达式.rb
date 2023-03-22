def infix_to_postfix(infix_expr)
    operator_stack = []
    postfix_stack = []
  
    operators = { "+" => 1, "-" => 1, "*" => 2, "/" => 2 }
  
    infix_expr.each_char do |c|
      if c.match?(/\d/)  # 如果是数字，直接入栈
        postfix_stack.push(c)
      elsif c == "("  # 如果是左括号，直接入栈
        operator_stack.push(c)
      elsif c == ")"  # 如果是右括号，则弹出操作符直到遇到左括号
        while operator_stack.last != "("
          postfix_stack.push(operator_stack.pop)
        end
        operator_stack.pop  # 弹出左括号
      else  # 如果是操作符
        while !operator_stack.empty? && operators[operator_stack.last] >= operators[c]
          postfix_stack.push(operator_stack.pop)
        end
        operator_stack.push(c)
      end
    end
  
    while !operator_stack.empty?
      postfix_stack.push(operator_stack.pop)
    end
  
    return postfix_stack.join("")
end

infix_expr = "5 + (6 * 7) - 8 / 2"
postfix_expr = infix_to_postfix(infix_expr)
puts postfix_expr  # 输出 "567*+82/-"

  
def evaluate_postfix_expression(expr)
    stack = []
    
    expr.each_char do |c|
      if c.match?(/\d/)  # 如果是数字，压入栈中
        stack.push(c.to_i)
      else  # 如果是运算符，弹出栈顶元素进行计算
        op2 = stack.pop
        op1 = stack.pop
        
        case c
        when "+"
          stack.push(op1 + op2)
        when "-"
          stack.push(op1 - op2)
        when "*"
          stack.push(op1 * op2)
        when "/"
          stack.push(op1 / op2)
        end
      end
    end
    
    return stack.pop
  end
  