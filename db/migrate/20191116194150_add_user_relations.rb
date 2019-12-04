class AddUserRelations < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :user
    add_reference :budget_categories, :user
  end
end
