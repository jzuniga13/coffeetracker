# == Schema Information
#
# Table name: favorite_brews
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  brew_id    :integer
#  user_id    :integer
#
class FavoriteBrew < ApplicationRecord
  belongs_to(:user)
  belongs_to(:brew)
end
