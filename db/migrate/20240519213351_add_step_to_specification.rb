class AddStepToSpecification < ActiveRecord::Migration[7.0]
  def change
    add_column :specifications, :step, :integer, default: 1
  end
end
