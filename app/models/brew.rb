# == Schema Information
#
# Table name: brews
#
#  id              :integer          not null, primary key
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
  has_many(:users, { :through => :favorite_brews, :source => :user })
  belongs_to(:instructions, { :class_name => "Instruction" })
  has_many(:favorite_brews, { :dependent => :destroy })
  belongs_to(:user)
  belongs_to(:brew_method, { :class_name => "Device", :foreign_key => "device_id" })
  belongs_to(:bean)
end
