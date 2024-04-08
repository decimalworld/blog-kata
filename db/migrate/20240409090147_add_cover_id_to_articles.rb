class AddCoverIdToArticles < ActiveRecord::Migration[7.1]
  def change
    add_reference :articles, :cover, type: :uuid
  end
end
