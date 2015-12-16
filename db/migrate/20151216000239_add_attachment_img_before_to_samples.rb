class AddAttachmentImgBeforeToSamples < ActiveRecord::Migration
  def self.up
    change_table :samples do |t|
      t.attachment :img_before
    end
  end

  def self.down
    remove_attachment :samples, :img_before
  end
end
