module PrimesMultiplicationTable

  def self.sieve_of_eratosfen(number)
    arr = Array.new(number, 1)
    arr[0] = 0
    arr[1] = 0

    (2..Math.sqrt(number).to_i).each do |p|
      next unless arr[p] == 1

      j = p**2
      while j <= number
        arr[j] = 0
        j += p
      end
    end

    arr.each_with_index.map { |e, i| i if e == 1 }.compact!
  end

  def self.product_of_multiplication(list)
    product = []

    list.each_with_index do |prime_number_y, i|
      row = []

      list.each do |prime_number_x|
        row << prime_number_x * prime_number_y
      end

      product << row
    end

    product
  end

  def self.output(number)
    number = number.to_i
    primes_list = sieve_of_eratosfen(number * 4).take(number)
    return if primes_list.empty?

    product = product_of_multiplication(primes_list)
    format_parameter = product.last.last.size / 2

    print_line(primes_list.unshift('|'), format_parameter)
    print_line(Array.new(number * 3, '-'), 1)

    product.each_with_index do |row, i|
      print_line(row.unshift(primes_list[i + 1].to_s + '|'), format_parameter)
    end
  end

  def self.print_line(row, format_parameter)
    puts row.map { |n| n.to_s.rjust(format_parameter, ' ') }.join(' ')
  end
end
