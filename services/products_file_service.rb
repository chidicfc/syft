class ProductsFileService
  DATA_FILE = 'data.csv'

  def self.raw_data
    data = []
    file = File.join(__dir__, '..', DATA_FILE)

    IO.foreach(file).with_index do |line, index|
      next if index.zero?
      product_details = line.chomp.split(',')
      data << {
        product_code: product_details[0],
        name: product_details[1],
        price: product_details[2].to_f
      }
    end

    data
  end
end
