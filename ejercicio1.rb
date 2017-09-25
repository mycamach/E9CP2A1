class Table
  attr_reader :table, :profit # 4 metodos de instancia: table, table= y profit, profit=
  def initialize(table, *profit) # metodo de clase
    @table = table
    @profit = profit.map(&:to_i)
  end

  def self.create_tables
    tables = []
    lines = File.open('casino.txt', 'r').readlines
    lines.each do |line|
      new_line = line.split(', ')
      tables << Table.new(new_line.shift, *new_line)
    end
    tables
  end

  def self.max_profit
    tables = create_tables
    best_tables = {}
    tables.each_with_index do |table, day|
      best_tables[table.table] = [table.profit.max, day + 1]
    end
    print best_tables.max_by { |k, v| v[0] }
  end
  
  def self.profit_average # Table.profit_average
    tables = create_tables
    results = []
    tables.each do |table|
      results << table.profit
    end
    results.flatten!
    puts results.inject(0) { |sum, i| sum + i } / results.size
  end
end

print Table.create_tables, "\n"
print Table.max_profit, "\n"
print Table.profit_average
