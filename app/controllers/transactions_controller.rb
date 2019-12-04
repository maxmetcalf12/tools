class TransactionsController < ApplicationController
  def index
    start_of_month = Time.now.start_of_month
    end_of_month = start_of_month.end_of_month
    transactions = Transaction.where(user: @user, date: start_of_month..end_of_month)
    render json: transactions
  end

  def update
    transaction = Transaction.find(params[:id])

    unless transaction.update(transaction_params)
      return redirect_to budget_path, notice: 'THIS DID NOT WORK' unless transaction.update(params_with_user)
    end
    redirect_to budget_path
  end

  def monthly_transactions
    month = params['month']
    start_of_month = Date.parse("#{month} 1, #{Time.now.year}")
    end_of_month = start_of_month.end_of_month
    @transactions = Transaction.where(user: @user, date: start_of_month..end_of_month).order(date: :asc)
    @budgets = BudgetCategory.where(user: @user)
    render partial: 'table'
  end

  def create
    transaction = Transaction.create(transaction_params)
    puts transaction

    redirect_to budget_path
  end

  private

  def transaction_params
    params.require(:transaction).permit(
      :title,
      :amount,
      :date,
      :budget_category_id,
      :user_id
    )
  end
end
