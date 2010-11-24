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
      
      MANEXPRESSIONS = [
        # '((%d %s %d) %s %d) %s %d' 44
        # +++
        '((%d + %d) + %d) + %d',
        # ++-
        '((%d + %d) + %d) - %d',
        # ++*
        '((%d + %d) + %d) * %d',
        '((%d + %d) * %d) + %d',
        '((%d * %d) + %d) + %d',
        # ++/
        '((%d + %d) + %d) / %d',
        '((%d + %d) / %d) + %d',
        '((%d / %d) + %d) + %d',
        # +--
        '((%d + %d) - %d) - %d',
        # +-*
        '((%d + %d) - %d) * %d',
        '((%d + %d) * %d) - %d',
        '((%d - %d) * %d) + %d',
        '((%d * %d) + %d) - %d',
        # +-/
        '((%d + %d) - %d) / %d',
        '((%d + %d) / %d) - %d',
        '((%d - %d) / %d) + %d',
        '((%d / %d) + %d) - %d',
        # +**
        '((%d + %d) * %d) * %d',
        '((%d * %d) + %d) * %d',
        '((%d * %d) * %d) + %d',
        # +//
        '((%d + %d) / %d) / %d',
        '((%d / %d) + %d) / %d',
        '((%d / %d) / %d) + %d',
        # ---
        '((%d - %d) - %d) - %d',
        # --*
        '((%d - %d) - %d) * %d',
        '((%d - %d) * %d) - %d',
        '((%d * %d) - %d) - %d',
        # --/
        '((%d - %d) - %d) / %d',
        '((%d - %d) / %d) - %d',
        '((%d / %d) - %d) - %d',
        # -**
        '((%d - %d) * %d) * %d',
        '((%d * %d) - %d) * %d',
        '((%d * %d) * %d) - %d',
        # -*/
        '((%d - %d) * %d) / %d',
        '((%d * %d) - %d) / %d',
        '((%d * %d) / %d) - %d',
        '((%d / %d) - %d) * %d',
        # -//
        '((%d - %d) / %d) / %d',
        '((%d / %d) - %d) / %d',
        '((%d / %d) / %d) - %d',
        # ***
        '((%d * %d) * %d) * %d',
        # **/
        '((%d * %d) * %d) / %d',
        # *//
        '((%d * %d) / %d) / %d',
        # ///
        '((%d / %d) / %d) / %d',
        
        # '(%d %s (%d %s %d)) %s %d' 8
        '(%d - (%d * %d)) * %d',
        '(%d - (%d / %d)) * %d',
        '(%d / (%d + %d)) * %d',
        '(%d / (%d - %d)) * %d',
        '(%d - (%d * %d)) / %d',
        '(%d - (%d / %d)) / %d',
        '(%d / (%d + %d)) / %d',
        '(%d / (%d - %d)) / %d',

        # '(%d %s %d) %s (%d %s %d)' 15
        '(%d * %d) + (%d * %d)',
        '(%d * %d) + (%d / %d)',
        '(%d / %d) + (%d / %d)',
        '(%d * %d) - (%d * %d)',
        '(%d * %d) - (%d / %d)',
        '(%d / %d) - (%d * %d)',
        '(%d / %d) - (%d / %d)',
        '(%d + %d) / (%d + %d)',
        '(%d + %d) / (%d - %d)',
        '(%d - %d) / (%d + %d)',
        '(%d - %d) / (%d - %d)',
        '(%d * %d) / (%d + %d)',
        '(%d * %d) / (%d - %d)',
        '(%d / %d) / (%d + %d)',
        '(%d / %d) / (%d - %d)',
        
        # '%d %s ((%d %s %d) %s %d)' 14
        '%d - ((%d + %d) * %d)',
        '%d - ((%d + %d) / %d)',
        '%d - ((%d - %d) * %d)',
        '%d - ((%d - %d) / %d)',
        '%d - ((%d * %d) * %d)',
        '%d - ((%d * %d) / %d)',
        '%d - ((%d / %d) / %d)',
        '%d / ((%d + %d) + %d)',
        '%d / ((%d + %d) - %d)',
        '%d / ((%d - %d) - %d)',
        '%d / ((%d * %d) + %d)',
        '%d / ((%d * %d) - %d)',
        '%d / ((%d / %d) + %d)',
        '%d / ((%d / %d) - %d)',
        
        # '%d %s (%d %s (%d %s %d))' 4
        '%d - (%d / (%d + %d))',
        '%d - (%d / (%d - %d))',
        '%d / (%d - (%d * %d))',
        '%d / (%d - (%d / %d))'
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
          #OPERATORS.each   do |op1| 
          #OPERATORS.each   do |op2| 
          #OPERATORS.each   do |op3|
          MANEXPRESSIONS.each do |expr|
            # evaluate using rational arithmetic
            #test = expr.gsub('%d', 'Rational(%d,1)') % [a, op1, b, op2, c, op3, d]
            test = expr.gsub('%d', 'Rational(%d,1)') % [a, b, c, d]
            value = eval(test) rescue -1  # catch division by zero
            if value == @@objective
              #@solutions << expr % [a, op1, b, op2, c, op3, d]
              @solutions << expr % [a, b, c, d]
            end
          end#;end;end;end
        end
        
        @solutions.each do |s|
          s.gsub!(/11/, 'J')
          s.gsub!(/12/, 'Q')
          s.gsub!(/13/, 'K')
        end
      end
    end
   
  end
end
