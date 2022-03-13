# == Schema Information
#
# Table name: devices
#
#  id         :integer          not null, primary key
#  device     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Device < ApplicationRecord
  validates :device, :uniqueness => { :case_sensitive => false }
  has_many(:brews, { :dependent => :destroy })
end
