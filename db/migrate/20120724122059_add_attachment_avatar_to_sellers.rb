class AddAttachmentAvatarToSellers < ActiveRecord::Migration
  def self.up
    change_table :sellers do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :sellers, :avatar
  end
end
