# == Schema Information
#
# Table name: transactions
#
#  id                 :bigint           not null, primary key
#  title              :string
#  date               :date
#  amount             :decimal(, )
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  budget_category_id :bigint
#  user_id            :bigint
#

class Transaction < ApplicationRecord
  ## ASSOCIATIONS
  belongs_to :budget_category, optional: true
  belongs_to :user
  ## SCOPES

  ## METHODS
  def pretty_date
    return nil unless date

    date.strftime("%b %-d")
  end

  def update(params)
    params[:user_id] = 2 if params[:user_id].nil? && user_id.nil?
    super
  end
end
