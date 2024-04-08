class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :title, null: false, limit: 300
      t.string :body, null: false, limit: 2000
      t.string :summary, null: false, limit: 300
      t.string :slug, limit: 300
      t.references :author, type: :uuid, null: false
      t.timestamps
    end

    add_index :articles, :slug
  end
end
