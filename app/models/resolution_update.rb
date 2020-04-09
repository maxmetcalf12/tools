# == Schema Information
#
# Table name: resolution_updates
#
#  id            :bigint           not null, primary key
#  resolution_id :bigint
#  title         :string
#  description   :string
#  date          :datetime
#  active        :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ResolutionUpdate < ApplicationRecord
  ## ASSOCIATIONS
  belongs_to :resolution

  def pretty_date
    return "No date" if date.nil?

    date.localtime.strftime("%b %-d")
  end
end
