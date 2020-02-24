# == Schema Information
#
# Table name: resolutions
#
#  id                :bigint           not null, primary key
#  user_id           :bigint
#  title             :string
#  short_description :string
#  full_description  :string
#  active            :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Resolution < ApplicationRecord
  ## ASSOCIATIONS
  belongs_to :user

  has_many :resolution_updates, dependent: :destroy
end
