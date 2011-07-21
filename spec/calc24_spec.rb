lib_path = File.expand_path('../../lib', __FILE__)
$:.unshift(lib_path)
require File.join(lib_path, 'calc24')

module Calc24

  describe TwentyFourGamePlayer do
    digicoll =  [
      %w{ 1 3 4 6 },
      %w{ 1 4 5 6 },
      %w{ 1 5 5 5 },
      %w{ 1 5 J J },
      %w{ 1 6 6 8 },
      %w{ 1 6 J K },
      %w{ 1 2 7 7 },
      %w{ 1 7 K K },
      %w{ 1 8 Q Q },
      %w{ 2 2 J J },
      %w{ 2 2 K K },
      %w{ 2 3 5 Q },
      %w{ 2 3 7 Q },
      %w{ 2 3 J J },
      %w{ 2 3 K K },
      %w{ 2 4 7 Q },
      %w{ 2 4 10 10 },
      %w{ 2 5 5 10 },
      %w{ 2 7 7 10 },
      %w{ 3 3 7 7 },
      %w{ 3 3 8 8 },
      %w{ 3 5 7 K },
      %w{ 3 6 6 J },
      %w{ 3 7 9 K },
      %w{ 3 8 8 10 },
      %w{ 4 4 7 7 },
      %w{ 4 4 10 10 },
      %w{ 4 5 8 K },
      %w{ 4 7 J K },
      %w{ 4 8 8 J },
      %w{ 4 8 8 K },
      %w{ 4 10 10 J },
      %w{ 5 5 7 J },
      %w{ 5 7 7 J },
      %w{ 5 5 8 J },
      %w{ 5 8 9 K },
      %w{ 5 9 10 J },
      %w{ 5 10 10 J },
      %w{ 5 10 10 K },
      %w{ 5 J Q Q },
      %w{ 6 6 6 J },
      %w{ 6 6 7 J },
      %w{ 6 6 9 K },
      %w{ 6 10 10 K },
      %w{ 6 J J Q },
      %w{ 6 Q Q K },
      %w{ 8 8 8 J },
      %w{ 8 8 8 Q },
      %w{ 8 8 9 Q },
      %w{ 8 J Q Q },
      %w{ 9 10 J K },
      %w{ 9 J Q Q },
      %w{ 10 Q Q Q }
    ]
    
    it "found solutions in #{digicoll.count} difficult subjects." do
      digicoll.each do |digits|
        TwentyFourGamePlayer.new(digits.to_i).solutions.should_not be_empty
      end
    end
    
    it "found no solutions with 7 6 4 3." do
      TwentyFourGamePlayer.new([7,6,4,3]).solutions.should be_empty
    end
    
  end
  
end
