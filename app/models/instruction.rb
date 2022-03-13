# == Schema Information
#
# Table name: instructions
#
#  id         :integer          not null, primary key
#  action     :string
#  step_num   :integer
#  time       :integer
#  weight     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  brew_id    :integer
#
class Instruction < ApplicationRecord
  belongs_to(:brew)
end
