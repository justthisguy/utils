class Rpngogo
  # Implement a RPN evaluator in Ruby. 
  # It should be able to evaluate the following strings and answer with the corresponding numbers:
  # "1 2 +" = 3
  # "4 2 /" = 2
  # "2 3 4 + *" = 14
  # "3 4 + 5 6 + *" = 77
  # And should provide an error message for the following types of errors
  # "1 +" 
  # (not enough arguments)
  # "a b +" 
  # (invalid number)
  attr_accessor :expression

  def initialize(expression = "")
    @expression = expression
  end

  def evaluate
    eval expression.split(' ')
  end

  private

  def eval (expr)
    puts "eval #{expr}"
    case expr.pop
    when "+"
      args = get_args(expr)
      return args[0] + args[1]
    when "-"
      args = get_args(expr)
      return args[0] - args[1]
    when "*"
      args = get_args(expr)
      return args[0] * args[1]
    when "/"
      args = get_args(expr)
      return args[0] / args[1]
    else
      return "invalid argument"
    end
    
  end
  
  def get_args (expr)
    puts "start get_args #{expr}"
    # if there are less than 2 arguments, it's just not enough
    if expr.count < 2
      puts "not enough"
      return "not enough arguments" 
    end 
    # if last is less than 48, it is not a number so let's look for the next triplet
    if expr.last.getbyte(0) < 48
      puts "not integer #{expr.last.getbyte(0)}"
      return eval(expr) 
    end
    puts "into get_args #{expr}"
     
    second = expr.pop.getbyte(0)-48
    first  = expr.pop.getbyte(0)-48
    return [first, second]
  end
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
end