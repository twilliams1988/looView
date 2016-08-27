class AddAttachmentPictureToLoos < ActiveRecord::Migration
  def self.up
    change_table :loos do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :loos, :picture
  end
end
