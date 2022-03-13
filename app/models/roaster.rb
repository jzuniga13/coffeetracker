# == Schema Information
#
# Table name: roasters
#
#  id         :integer          not null, primary key
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Roaster < ApplicationRecord
  validates :name, :presence => true
  validates :name, :uniqueness => {:case_sensitive => false}
  has_many(:beans, { :dependent => :destroy })
end
