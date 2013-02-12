require_relative '../ccutils'

describe CCutils do
  
  # American Express (15 Digits)  341405332182749
  # American Express (15 Digits)  378282246310005
  # American Express (15 Digits)  371449635398431
  # Amex Corporate   (15 Digits)  378734493671000
	describe "AMEX" do
		it "34 good" do
      CCutils.check("341405332182749").should == true
    end

		it "37 good 1" do
      CCutils.check("378282246310005").should == true
    end
    
		it "37 good 2" do
      CCutils.check("371449635398431").should == true
    end
    
		it "bad too short" do
      CCutils.check("37828224631000").should == false
    end
    
		it "bad too long" do
      CCutils.check("37144963539843118").should == false
    end
    
		it "bad wrong checksum" do
      CCutils.check("371449535398431").should == false
    end
  end

  # Master Card (16 Digits)  5105105105105100
  # Master Card (16 Digits)  5555555555554444
  describe "MasterCard" do
    it "good 1" do
      CCutils.check("5105105105105100").should == true
    end
  
    it "good 2" do
      CCutils.check("5555555555554444").should == true
    end
  
		it "bad too short" do
      CCutils.check("510510510510510").should == false
    end
    
		it "bad too long" do
      CCutils.check("51051051051051000").should == false
    end
    
		it "bad wrong checksum" do
      CCutils.check("5109905105105100").should == false
    end
  end
  
  # Visa (13 Digits)  4222222222222
  # Visa (16 Digits)  4111111111111111
  # Visa (16 Digits)  4012888888881881
	describe "Visa" do
		it "13 good" do
      CCutils.check("4222222222222").should == true
    end

		it "16 good 1" do
      CCutils.check("4111111111111111").should == true
    end
    
		it "16 good 2" do
      CCutils.check("4012888888881881").should == true
    end
    
		it "bad length 12" do
      CCutils.check("422222222222").should == false
    end

		it "bad length 14" do
      CCutils.check("42222222222222").should == false
    end

		it "bad length 15" do
      CCutils.check("422222222222222").should == false
    end
    
		it "bad length 17" do
      CCutils.check("42222222222222222").should == false
    end
        
		it "bad wrong checksum" do
      CCutils.check("4012888888881861").should == false
    end  
  end
  
  # Discover (16 Digits)  6011111111111117
  # Discover (16 Digits)  6011000990139424
  describe "Discover" do
    it "good 1" do
      CCutils.check("6011111111111117").should == true
    end
  
    it "good 2" do
      CCutils.check("6011000990139424").should == true
    end
  
		it "bad too short" do
      CCutils.check("601100099013942").should == false
    end
    
		it "bad too long" do
      CCutils.check("60110009901394245").should == false
    end
    
		it "bad wrong checksum" do
      CCutils.check("6011000996139424").should == false
    end
  end
end
