class AddTitleToIdea < ActiveRecord::Migration[5.0]
  def change
    add_column :ideas, :title, :string
  end
end
