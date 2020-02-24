class CreateResolutions < ActiveRecord::Migration[6.0]
  def change
    create_table :resolutions do |t|
      t.belongs_to :user

      t.string :title
      t.string :short_description
      t.string :full_description
      t.boolean :active

      t.timestamps
    end
  end
end
