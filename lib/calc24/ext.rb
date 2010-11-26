class Array
  def to_i
    self.map do |arg| 
      begin
        case arg.upcase
          when 'J' then 11
          when 'Q' then 12
          when 'K' then 13
          when 'A' then 1
          else Integer(arg)
        end
      rescue ArgumentError
        raise "unknown digit: '#{arg}'"
      end
    end
  end
end

class String
  def to_p
    {'11' => 'J', '12' => 'Q', '13' => 'K'}.each {|digit, poker| self.gsub!(digit, poker)}
  end
end
