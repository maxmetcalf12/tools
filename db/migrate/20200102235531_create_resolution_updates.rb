class CreateResolutionUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :resolution_updates do |t|
      t.belongs_to :resolution

      t.string :title
      t.string :description
      t.datetime :date
      t.boolean :active

      t.timestamps
    end
  end
end
