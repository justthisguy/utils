require_relative '../rpngogo'
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

describe Rpngogo do
  
  it "'1 2 +' = 3" do
    calc = Rpngogo.new "1 2 +"
    calc.evaluate.should == 3
  end

  it "'5 2 -' = 3" do
    calc = Rpngogo.new "5 2 -"
    calc.evaluate.should == 3
  end

  it "'3 2 *' = 6" do
    calc = Rpngogo.new "3 2 *"
    calc.evaluate.should == 6
  end

  it "'4 2 /' = 2" do
    calc = Rpngogo.new "4 2 /"
    calc.evaluate.should == 2
  end

  it "'2 3 4 + *' = 14" do
        calc = Rpngogo.new "1 2 +"
        calc.evaluate.should == 3
  end

  it "'3 4 + 5 6 + *' = 77" do
        calc = Rpngogo.new "3 4 + 5 6 + *"
        calc.evaluate.should == 77
  end

  it "'1 +' does not have enough arguments" do
        calc = Rpngogo.new "1 +"
        calc.evaluate.should == "not enough arguments"
  end

  it "'a b +' has invalid number" do
        calc = Rpngogo.new "a b +"
        calc.evaluate.should == "invalid number"
  end

  it "extra" do
        calc = Rpngogo.new "3 4 + 6 + *"
        calc.evaluate.should == "not enough arguments"

        calc = Rpngogo.new "Q 4 + 5 6 + *"
        calc.evaluate.should == "invalid number"

  end

  it "'Q 4 + 5 6 + *' = 77" do
        calc = Rpngogo.new "Q 4 + 5 6 + *"
        calc.evaluate.should == "invalid number"
  end


end