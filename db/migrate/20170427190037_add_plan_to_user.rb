class AddPlanToUser < ActiveRecord::Migration[5.0]
  #make a change to our user's table
  def change
    #users, with a plan id that has an integer indicating what plan it is
    #ex: 1 for basic plan, and 2 for pro plan
    add_column :users, :plan_id, :integer
  end
end
