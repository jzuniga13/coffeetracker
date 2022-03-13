# == Schema Information
#
# Table name: beans
#
#  id                :integer          not null, primary key
#  country_of_origin :string
#  name              :string
#  process           :string
#  roast_date        :datetime
#  roast_level       :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  roaster_id        :integer
#
class Bean < ApplicationRecord
  validates :name, :presence => true
  belongs_to(:roaster)
  has_many(:brews, { :dependent => :destroy })
end
