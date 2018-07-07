class Table
  attr_reader :table, :recaudaciones 
  def initialize(table, *recaudaciones) 
    @table = table
    @recaudaciones = recaudaciones.map(&:to_i)
  end

  def self.crea_tables
    tables = []
    lines = File.open('casino.txt', 'r').readlines
    lines.each do |line|
      new_line = line.split(', ')
      tables << Table.new(new_line.shift, *new_line)
    end
    tables
  end

  def self.max_recaudaciones
    tables = crea_tables
    mas_tables = {}
    tables.each_with_index do |table, day|
      mas_tables[table.table] = [table.recaudaciones.max, day + 1]
    end
    print mas_tables.max_by { |k, v| v[0] }
  end
  
  def self.recaudaciones_promedio 
    tables = crea_tables
    resultados = []
    tables.each do |table|
      resultados << table.recaudaciones
    end
    resultados.flatten!
    puts resultados.inject(0) { |sum, i| sum + i } / resultados.size
  end
end

print Table.crea_tables, "\n"
print Table.max_recaudaciones, "\n"
print Table.recaudaciones_promedio