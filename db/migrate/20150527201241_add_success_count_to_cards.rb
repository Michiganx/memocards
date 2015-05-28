class AddSuccessCountToCards < ActiveRecord::Migration
  def change
    add_column :cards, :success_count, :integer
  end
end
