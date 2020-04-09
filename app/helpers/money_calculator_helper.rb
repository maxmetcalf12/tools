module MoneyCalculatorHelper
  def calculate_total_money(data)
    num_years = data['contribution_stop_age'] - data['current_age']
    compounding_years = data['cash_out_age'] - data['current_age']
    rate = 1.0 + data['rate'] / 100.0

    total_money = data['initial_deposit'] * (rate**compounding_years)

    (1..compounding_years).each do |year_number|
      compounding_multiple = rate**(compounding_years - year_number)
      total_money += data['yearly_amount'] * compounding_multiple if year_number <= num_years
    end

    total_money
  end

  def calculate_invested_amount(data)
    data['initial_deposit'] + data['yearly_amount'] * (data['contribution_stop_age'] - data['current_age'])
  end

  def calculate_option_price(data)
    change_in_price = data['target_underlying_price'] - data['current_price_underlying']

    delta_change = change_in_price * data['delta']
    delta_gamma_change = change_in_price.abs * (change_in_price.abs - 1) * data['gamma']
    theta_change = data['theta'] * data['days_from_now']

    data['current_option_price'] + delta_change + delta_gamma_change + theta_change
  end
end
