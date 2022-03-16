# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many(:favorited_brews, { :through => :favorite_recipes, :source => :brew })
  has_many(:brews, { :dependent => :destroy })
  has_many(:favorite_recipes, { :class_name => "FavoriteBrew", :dependent => :destroy })
  def full_name
    return self.first_name + " " + self.last_name
  end
end
