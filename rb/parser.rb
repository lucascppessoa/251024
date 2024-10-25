require 'date'
require_relative 'categorizer'

class Parser
  include Categorizer

  attr_reader :ref_date

  def initialize(ref_date)
    @ref_date = parse_date ref_date
  end

  def parse(line)
    value, sector, next_payment = line.split(' ')

    categorize Trade.new(value: value.to_f, sector:, next_payment: parse_date(next_payment), ref_date:)
  end

  private

  def parse_date(date)
    Date.strptime date, '%m/%d/%Y'
  end

  Trade = Struct.new(:value, :sector, :next_payment, :ref_date)
end
