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
    begin
      eval expression.split(' ')
    rescue SyntaxError
      return "not enough arguments"
    rescue StandardError
      return "invalid number"
    end
  end

  private

  def eval (expr)
    # puts "eval #{expr}"
    case expr.pop
    when "+"
      second = get_arg(expr)
      first = get_arg(expr)
      return first + second
    when "-"
      second = get_arg(expr)
      first = get_arg(expr)
      return first - second
    when "*"
      second = get_arg(expr)
      first = get_arg(expr)
      return first * second
    when "/"
      second = get_arg(expr)
      first = get_arg(expr)
      return first / second
    else
      raise StandardError
    end
    
  end

  def get_arg (expr)
    #
    ascii_for_zero = 48
    # if there are less than 1 arguments, it's just not enough
    raise SyntaxError if expr.count < 1
    # if last is less than 48, it is not a number so let's look for the next triplet
    return eval(expr) if expr.last.getbyte(0) < ascii_for_zero
    # if it is greater than
    
    raise StandardError if (arg = expr.pop.getbyte(0)-ascii_for_zero) > 9 
    arg
  end
end