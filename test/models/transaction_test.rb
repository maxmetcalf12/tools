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

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
