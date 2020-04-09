class BudgetController < ApplicationController
  def index
    @month = params["month"].presence || Date.today.strftime("%B")
    @new_transaction = Transaction.new
    @new_budget = BudgetCategory.new
    start_of_month = Date.parse("#{@month} 1, #{Time.now.year}")
    end_of_month = start_of_month.end_of_month

    @budgets = BudgetCategory.where(user: @user).includes(:transactions)
    @transactions = Transaction.where(user: @user).order(date: :desc).order(:amount)

    @budget_sum = {}
    @budgets.each do |budget|
      @budget_sum[budget.name] = budget.transactions.where(date: start_of_month..end_of_month).sum(:amount)
    end
  end

  def monthly_sum
    month = params["month"]
    start_of_month = Date.parse("#{month} 1, #{Time.now.year}")
    end_of_month = start_of_month.end_of_month
    @budgets = BudgetCategory.where(user: @user).includes(:transactions)
    @budget_sum = {}
    @budgets.each do |budget|
      @budget_sum[budget.name] = budget.transactions.where(date: start_of_month..end_of_month).sum(:amount)
    end
    render partial: "budget_table"
  end
end
