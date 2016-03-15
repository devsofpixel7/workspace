class AddChefIdToRecipes < ActiveRecord::Migration
  def change
    # 1st arg: name of the table that we're making change to
    # 2nd arg: field we want to add
    # 3rd arg: type (integer)
    add_column :recipes, :chef_id, :integer
  end
end
