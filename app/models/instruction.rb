# == Schema Information
#
# Table name: instructions
#
#  id            :integer          not null, primary key
#  step_1_action :string
#  step_1_time   :integer
#  step_1_weight :integer
#  step_2_action :string
#  step_2_time   :integer
#  step_2_weight :integer
#  step_3_action :string
#  step_3_time   :integer
#  step_3_weight :integer
#  step_4_action :string
#  step_4_time   :integer
#  step_4_weight :integer
#  step_5_action :string
#  step_5_time   :integer
#  step_5_weight :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Instruction < ApplicationRecord
  has_many(:brews, { :foreign_key => "instructions_id", :dependent => :destroy })
end
