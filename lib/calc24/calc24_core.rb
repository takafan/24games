require 'rational'

module Calc24
  
  class TwentyFourGamePlayer
    MAN4D4S = [
# '((%d %s %d) %s %d) %s %d' 48
# +++
'%d + %d + %d + %d',
# ++-
'%d + %d + %d - %d',
# ++*
'(%d + %d + %d) * %d',
'(%d + %d) * %d + %d',
'%d * %d + %d + %d',
# ++/
'(%d + %d + %d) / %d',
'(%d + %d) / %d + %d',
'(%d / %d) + %d + %d',
# +--
'%d + %d - %d - %d',
# +-*
'(%d + %d - %d) * %d',
'(%d + %d) * %d - %d',
'(%d - %d) * %d + %d',
'%d * %d + %d - %d',
# +-/
'(%d + %d - %d) / %d',
'(%d + %d) / %d - %d',
'(%d - %d) / %d + %d',
'%d / %d + %d - %d',
# +**
'(%d + %d) * %d * %d',
'(%d * %d + %d) * %d',
'%d * %d * %d + %d',
# +*/
'(%d + %d) * %d / %d',
'(%d * %d + %d) / %d',
'%d * %d / %d + %d',
'(%d / %d + %d) * %d',
# +//
'(%d + %d) / %d / %d',
'(%d / %d + %d) / %d',
'%d / %d / %d + %d',
# ---
'%d - %d - %d - %d',
# --*
'(%d - %d - %d) * %d',
'(%d - %d) * %d - %d',
'%d * %d - %d - %d',
# --/
'(%d - %d - %d) / %d',
'(%d - %d) / %d - %d',
'%d / %d - %d - %d',
# -**
'(%d - %d) * %d * %d',
'(%d * %d - %d) * %d',
'%d * %d * %d - %d',
# -*/
'(%d - %d) * %d / %d',
'(%d * %d - %d) / %d',
'%d * %d / %d - %d',
'(%d / %d - %d) * %d',
# -//
'(%d - %d) / %d / %d',
'(%d / %d - %d) / %d',
'%d / %d / %d - %d',
# ***
'%d * %d * %d * %d',
# **/
'%d * %d * %d / %d',
# *//
'%d * %d / %d / %d',
# ///
'%d / %d / %d / %d',

# '(%d %s (%d %s %d)) %s %d' +8
'(%d - %d * %d) * %d',
'(%d - %d / %d) * %d',
'%d / (%d + %d) * %d',
'%d / (%d - %d) * %d',
'(%d - %d * %d) / %d',
'(%d - %d / %d) / %d',
'%d / (%d + %d) / %d',
'%d / (%d - %d) / %d',

# '(%d %s %d) %s (%d %s %d)' +14
'%d * %d + %d * %d',
'%d * %d + %d / %d',
'%d / %d + %d / %d',
'%d * %d - %d * %d',
'%d * %d - %d / %d',
'%d / %d - %d * %d',
'%d / %d - %d / %d',
'(%d + %d) * (%d + %d)',
'(%d + %d) * (%d - %d)',
'(%d - %d) * (%d - %d)',
'(%d + %d) / (%d + %d)',
'(%d + %d) / (%d - %d)',
'(%d - %d) / (%d + %d)',
'(%d - %d) / (%d - %d)',

# '%d %s ((%d %s %d) %s %d)' +14
'%d - ((%d + %d) * %d)',
'%d - ((%d + %d) / %d)',
'%d - ((%d - %d) * %d)',
'%d - ((%d - %d) / %d)',
'%d - (%d * %d * %d)',
'%d - (%d * %d / %d)',
'%d - (%d / %d / %d)',
'%d / (%d + %d + %d)',
'%d / (%d + %d - %d)',
'%d / (%d - %d - %d)',
'%d / (%d * %d + %d)',
'%d / (%d * %d - %d)',
'%d / (%d / %d + %d)',
'%d / (%d / %d - %d)',

# '%d %s (%d %s (%d %s %d))' +4
'%d - (%d / (%d + %d))',
'%d - (%d / (%d - %d))',
'%d / (%d - %d * %d)',
'%d / (%d - %d / %d)'
    ]

    @@objective = Rational(24,1)
   
    def initialize(numbers)
      @numbers = numbers
      @solutions = {}
      solve
    end
   
    attr_reader :numbers, :solutions
   
    def solve
      numbers.permutation.to_a.uniq.each do |a,b,c,d|
        MAN4D4S.each do |expr|
          # evaluate using rational arithmetic
          test = expr.gsub('%d', 'Rational(%d,1)') % [a, b, c, d]
          value = eval(test) rescue -1  # catch division by zero
          if value == @@objective
            @solutions[expr] = expr % [a, b, c, d]
          end
        end
      end
    end
    
  end

end
