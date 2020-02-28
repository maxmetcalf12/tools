class MoneyCalculatorController < ApplicationController
  def calculate
    current_age = params[:current_age].to_i
    rate = params[:rate].to_i
    initial_deposit = params[:initial_deposit].to_i
    monthly_amount = params[:monthly_amount].to_i
    yearly_amount = params[:yearly_amount].to_i
    contribution_stop_age = params[:contribution_stop_age].to_i
    cash_out_age = params[:cash_out_age].to_i

    contribution_years = contribution_stop_age - current_age
    compounding_years = cash_out_age - current_age
    rate = 1.0 + rate / 100.0
    @total_money = initial_deposit * (rate**compounding_years)

    (1..compounding_years).each do |year_number|
      compounding_multiple = (1.0 + rate / 100.0)**(compounding_years - year_number)
      @total_money += yearly_amount * compounding_multiple if year_number <= contribution_years
    end

    render 'index'
  end
end
