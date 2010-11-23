require 'rational'

module Calc24
  module Exec
    
    
    class TwentyFourGamePlayer
      EXPRESSIONS = [
        '((%d %s %d) %s %d) %s %d',
        '(%d %s (%d %s %d)) %s %d',
        '(%d %s %d) %s (%d %s %d)',
        '%d %s ((%d %s %d) %s %d)',
        '%d %s (%d %s (%d %s %d))',
      ]
      OPERATORS = [:+, :-, :*, :/]
     
      @@objective = Rational(24,1)
     
      def initialize(digits)
        @digits = digits
        @solutions = []
        @s = {}
        solve
      end
     
      attr_reader :digits, :solutions, :s
     
      def solve
        digits.permutation.to_a.uniq.each do |a,b,c,d|
          OPERATORS.each   do |op1| 
          OPERATORS.each   do |op2| 
          OPERATORS.each   do |op3|
          EXPRESSIONS.each do |expr|
            # evaluate using rational arithmetic
            test = expr.gsub('%d', 'Rational(%d,1)') % [a, op1, b, op2, c, op3, d]
            value = eval(test) rescue -1  # catch division by zero
            if value == @@objective
              @solutions << expr % [a, op1, b, op2, c, op3, d]
            end
          end;end;end;end
        end
        
        acceptance = [
          # begin with +
          # +++
          ((a + b) + c) + d
          # ++-
          ((a + b) + c) - d
          # ++*
          ((a + b) + c) * d
          ((a + b) * c) + d
          ((a * b) + c) + d
          # ++/
          ((a + b) + c) / d
          ((a + b) / c) + d
          ((a / b) + c) + d
          # +--
          ((a + b) - c) - d
          # +-*
          ((a + b) - c) * d
          ((a + b) * c) - d
          ((a * b) + c) - d
          ((a - b) * c) + d
          ((a * b) - c) + d
          # +-/
          ((a + b) - c) / d
          ((a + b) / c) - d
          ((a / b) + c) - d
          ((a - b) + c) / d
          ((a - b) / c) + d
          # +**
          ((a + b) * c) * d
          ((a * b) + c) * d
          ((a * b) * c) + d
          # +//
          ((a + b) / c) / d
          ((a / b) + c) / d
          ((a / b) / c) + d
          
          # begin with -
          # ---
          ((a - b) - c) - d
          # --*
          ((a - b) - c) * d
          ((a - b) * c) - d
          ((a * b) - c) - d
          # --/
          ((a - b) - c) / d
          ((a - b) / c) - d
          ((a / b) - c) - d
          # -**
          ((a - b) * c) * d
          ((a * b) - c) * d
          ((a * b) * c) - d
          # -*/
          ((a - b) * c) / d
          ((a - b) / c) * d
          ((a / b) - c) * d
          ((a * b) - c) / d
          ((a / b) * c) - d
          
          ((a * b) * c) * d
        ]
        
        @solutions.each do |s|
          
          #TODO: merge solutions
          @s[s.sub("#{@digits[0]}", 'a').sub("#{@digits[1]}", 'b').sub("#{@digits[2]}", 'c').sub("#{@digits[3]}", 'd')] = s
          

          s.gsub!(/11/, 'J')
          s.gsub!(/12/, 'Q')
          s.gsub!(/13/, 'K')
          s.gsub!(/1/, 'A')
          
          
        end
      end
     
    end
   
  end
end
