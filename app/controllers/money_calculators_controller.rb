class MoneyCalculatorsController < ApplicationController
  skip_before_action :verify_authenticity_token
  include MoneyCalculatorHelper

  def calculate
    @total_money = calculate_total_money(params_to_number(money_value_params))
    @contributed_money = calculate_invested_amount(params_to_number(money_value_params))

    render 'index'
  end

  def stock_options_calculator
    @option_price = calculate_option_price(params_to_number(stock_option_params))

    render 'stock_options'
  end

  private

  def money_value_params
    params.permit(
      :current_age,
      :rate,
      :initial_deposit,
      :monthly_amount,
      :yearly_amount,
      :contribution_stop_age,
      :cash_out_age
    )
  end

  def params_to_number(data)
    Hash[data.to_h.map { |k, v| [k, v.to_f] }]
  end

  def stock_option_params
    params.permit(
      :strike_price,
      :expiration_date,
      :current_option_price,
      :current_price_underlying,
      :theta,
      :delta,
      :gamma,
      :target_underlying_price,
      :days_from_now
    )
  end
end
