class AddAttachmentImgAfterToSamples < ActiveRecord::Migration
  def self.up
    change_table :samples do |t|
      t.attachment :img_after
    end
  end

  def self.down
    remove_attachment :samples, :img_after
  end
end
