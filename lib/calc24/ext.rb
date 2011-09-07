class Array
  def to_i
    self.map do |char| 
      char.to_i
    end
  end
end

class String
  def to_i
    begin
      case self.upcase
        when 'J' then 11
        when 'Q' then 12
        when 'K' then 13
        when 'A' then 1
        else Integer(self)
      end
    rescue ArgumentError
      raise "    unknown number: '#{self}'"
    end
  end
  
  def to_p
    {'11' => 'J', '12' => 'Q', '13' => 'K'}.each {|number, poker| self.gsub!(number, poker)}
    self
  end
end
