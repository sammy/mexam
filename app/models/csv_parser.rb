class CsvParser
  
  require 'csv'
  
  def initialize(file)
    @data = []
    CSV.foreach(file.path, headers: true) do |row|
      row_data = row.to_hash
      row_data.values.each { |value| value.strip! if value.is_a? String }
      @data << row_data
    end
  end

  def data
    @data
  end

end