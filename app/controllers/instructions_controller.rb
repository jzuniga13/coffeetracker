class InstructionsController < ApplicationController
  def index
    matching_instructions = Instruction.all

    @list_of_instructions = matching_instructions.order({ :created_at => :desc })

    render({ :template => "instructions/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_instructions = Instruction.where({ :id => the_id })

    @the_instruction = matching_instructions.at(0)

    render({ :template => "instructions/show.html.erb" })
  end

  def create
    require 'time'
    the_instruction = Instruction.new
    the_instruction.brew_id = params.fetch("path_id")
    the_instruction.step_num = Instruction.where({:brew_id => params.fetch("path_id")}).count + 1
    the_instruction.action = params.fetch("query_step_action")
    the_instruction.weight = params.fetch("query_step_weight")
    t1 = Time.parse("00:0"+params.fetch("query_step_time"))
    end_time = t1.min*60+t1.sec
    the_instruction.time = t1.min*60+t1.sec

    if the_instruction.valid?
      the_instruction.save
      redirect_to("/brew_instructions/#{params.fetch("path_id")}", { :notice => "Instruction created successfully." })
    else
      redirect_to("/brew_instructions/#{params.fetch("path_id")}", { :alert => the_instruction.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_instruction = Instruction.where({ :id => the_id }).at(0)

    the_instruction.step_1_action = params.fetch("query_step_1_action")
    the_instruction.step_1_weight = params.fetch("query_step_1_weight")
    the_instruction.step_1_time = params.fetch("query_step_1_time")
    the_instruction.step_2_action = params.fetch("query_step_2_action")
    the_instruction.step_2_weight = params.fetch("query_step_2_weight")
    the_instruction.step_2_time = params.fetch("query_step_2_time")
    the_instruction.step_3_action = params.fetch("query_step_3_action")
    the_instruction.step_3_weight = params.fetch("query_step_3_weight")
    the_instruction.step_3_time = params.fetch("query_step_3_time")
    the_instruction.step_4_action = params.fetch("query_step_4_action")
    the_instruction.step_4_weight = params.fetch("query_step_4_weight")
    the_instruction.step_4_time = params.fetch("query_step_4_time")
    the_instruction.step_5_action = params.fetch("query_step_5_action")
    the_instruction.step_5_weight = params.fetch("query_step_5_weight")
    the_instruction.step_5_time = params.fetch("query_step_5_time")

    if the_instruction.valid?
      the_instruction.save
      redirect_to("/instructions/#{the_instruction.id}", { :notice => "Instruction updated successfully."} )
    else
      redirect_to("/instructions/#{the_instruction.id}", { :alert => the_instruction.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_instruction = Instruction.where({ :id => the_id }).at(0)

    the_instruction.destroy

    redirect_to("/instructions", { :notice => "Instruction deleted successfully."} )
  end
end
