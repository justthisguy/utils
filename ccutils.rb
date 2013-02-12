class CCutils
  # Card Type
  # AMEX      34 or 37 
  # Visa      4
  # Master    51 - 55
  # Discover  6011
  # Number Length
  # 15 16 16
  # 13 or 16

  def self.check(num)
    case num[0]
    when '3' # perhaps AMEX
      return false if !( (num[1]=='4' || num[1]=='7') && num.length==15 )
      
    when '4' # perhaps Visa
      return false if !( (num.length==13 || num.length==16) )
    
    when '5' # perhaps Master
      return false if !( (num[1]=='1' || num[1]=='2' || num[1]=='3' || num[1]=='4' || num[1]=='5') && num.length==16 )
    
    when '6' # perhaps Discover
      return false if !(  (num[1]=='0' && num[2]=='1' && num[3]=='1') && num.length==16 )
      
    else
      return false
    
    end
    self.checksum(num)
  end
  
    
  # The card number should also pass this test.
  # 1. Starting with the next to last digit and continuing with every other digit going back to the beginning of the card, double the digit 
  # 2. Sum all doubled and untouched digits in the number
  # 3. If that total is a multiple of 10, the number is valid
  # e.g. 4408 0412 3456 7893:
  # Step 1: 8 4 0 8 0 4 2 2 6 4 10 6 14 8 18 3
  # Step 2: 8+4+0+8+0+4+2+2+6+4+1+0+6+1+4+8+1+8+3 = 70 
  # Step 3: 70 % 10 == 0
  def self.checksum(num)
    a=num.split(//)
    total=0
    while char=a.pop
      int=char.to_i
      total+=int
      # p a, total #~~~~~~~~~~~~~~~~~~~~~~~~~~
      if char=a.pop
        int=(char.to_i)*2
        int<10 ? total+=int : total+=int-9
        # p a, int, int%10, total #~~~~~~~~~~~~~~~~~~~~~~~~~~
      end
    end
    if total%10==0
      return true
    else
      return false
    end
  end
end