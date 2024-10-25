module Categorizer
  def categorize(trade)
    if expired? trade.ref_date, trade.next_payment
      'EXPIRED'
    elsif medium_risk? trade.value, trade.sector
      'MEDIUMRISK'
    else
      'LOWRISK'
    end
  end

  private

  def medium_risk?(value, sector)
    value > 1_000_000 && sector == 'Private'
  end

  def expired?(ref_date, next_payment)
    (ref_date - next_payment).to_i > 30
  end
end
