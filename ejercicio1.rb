class Table
  attr_reader :table, :day1, :day2, :day3
  def initiator(table, day1, day2, day3)
    @table = table
    @day1 = day1.to_i
    @day2 = day2.to_i
    @day3 = day3.to_i
  end

  def file(filename)
    data = File.open(filename, 'r').readlines
    data.map do |ele|
      casino_table = ele.split(', ').map(&:chomp)
      print casino_table
    end

  def method_name
  end
  def method_name
  end
   end 
  end
end
