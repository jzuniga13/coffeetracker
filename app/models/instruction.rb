# == Schema Information
#
# Table name: instructions
#
#  id         :integer          not null, primary key
#  action     :string
#  step_num   :integer
#  time       :integer
#  weight     :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  brew_id    :integer
#
class Instruction < ApplicationRecord
  validates :step_num, :presence => true
  validates :action, :presence => true
  validates :weight, :presence => true
  validates :time, :presence => true
  validates :time, numericality: {:less_than => 900}
  belongs_to(:brew)
end
