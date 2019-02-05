class AddPositionIdToMember < ActiveRecord::Migration[5.2]
  def change
    add_reference :members, :position, foreign_key: true
  end
end
