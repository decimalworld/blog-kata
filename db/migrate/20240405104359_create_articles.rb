class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title, null: false, limit: 300
      t.string :body, null: false, limit: 2000
      t.string :summary, null: false, limit: 300
      t.references :author, type: :uuid, null: false
      t.timestamps
    end
  end
end
