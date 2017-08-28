class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string  :first_name
      t.string  :last_name
      t.string  :company_name
      t.string  :profession
      t.string  :specialty
      t.string  :job_title
      t.string  :work_number
      t.string  :mobile_number
      t.string  :contact_email
      t.string  :linkedin_url
      t.string  :facebook_url
      t.text    :description
      
      t.timestamps
      
    end
  end
end
