# == Schema Information
#
# Table name: budget_categories
#
#  id            :bigint           not null, primary key
#  name          :string
#  budget_amount :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :bigint
#

class BudgetCategory < ApplicationRecord
  ## ASSOCIATIONS
  belongs_to :user

  has_many :transactions
end
