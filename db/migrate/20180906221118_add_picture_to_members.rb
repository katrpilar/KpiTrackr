class AddPictureToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :picture, :string
  end
end
