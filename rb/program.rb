require 'readline'
require_relative 'parser'

class Program
  def self.run
    parser = Parser.new ref_date
    ref_date = Readline.readline("Ref Date> ", true)
    count = Readline.readline("Count> ", true).to_i
    trades = []

    count.times do
      trades << parser.parse(Readline.readline("Trade> ", true))
    end

    puts trades
  end
end

Program.run

# Sample inputs
# 12/11/2020
# 4
# 2000000 Private 12/29/2025
# 400000 Public 07/01/2020
# 5000000 Public 01/02/2024
# 3000000 Public 10/26/2023
