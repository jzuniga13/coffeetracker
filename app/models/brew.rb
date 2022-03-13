# == Schema Information
#
# Table name: brews
#
#  id              :integer          not null, primary key
#  coffee_weight   :integer
#  comments        :string
#  flavors         :string
#  grind_setting   :integer
#  grinder         :string
#  water_temp      :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  bean_id         :integer
#  device_id       :integer
#  instructions_id :integer
#  user_id         :integer
#
class Brew < ApplicationRecord
  validates :bean_id, :presence => true
  has_many(:users, { :through => :favorite_brews, :source => :user })
  has_many(:instructions, { :dependent => :destroy })
  has_many(:favorite_brews, { :dependent => :destroy })
  belongs_to(:user)
  belongs_to(:device)
  belongs_to(:bean)
end
