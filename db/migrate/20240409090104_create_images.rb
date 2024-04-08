class CreateImages < ActiveRecord::Migration[7.1]
  def change
    create_table :images, id: :uuid do |t|
      t.references  :imageable, type: :uuid
      t.string      :imageable_type, null: false
      t.string      :extension, null: false, default: "txt"
      t.timestamps
    end
  end
end
