class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.string :title
      t.date :date
      t.decimal :amount

      t.timestamps
    end
  end
end
