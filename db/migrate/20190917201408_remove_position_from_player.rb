class RemovePositionFromPlayer < ActiveRecord::Migration[5.2]
  def change
    remove_column :players, :position
  end
end
