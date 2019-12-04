class ChangeTransactionAssociations < ActiveRecord::Migration[6.0]
  def change
    add_reference :transactions, :budget_category
  end
end
