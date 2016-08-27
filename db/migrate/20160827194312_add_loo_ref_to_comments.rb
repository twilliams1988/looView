class AddLooRefToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :loo, foreign_key: true
  end
end
