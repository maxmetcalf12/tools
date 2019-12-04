class BudgetCategoriesController < ApplicationController
  def create
    budget_cat = BudgetCategory.create(budget_cat_params)

    redirect_to budget_path
  end

  private

  def budget_cat_params
    params.require(:budget_category).permit(
      :name,
      :budget_amount,
      :user_id
    )
  end
end
