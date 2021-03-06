class CreateFeeds < ActiveRecord::Migration[5.2]
  def change
    create_table :feeds, id: :uuid  do |t|
      t.string :title
      t.text :description
      t.jsonb :image
      t.string :url
      t.string :categories, array: true
      t.float :rank, default: 0
      t.integer :status, default: 0
      t.timestamps
    end

    add_index :feeds, :categories, using: 'gin'
    add_index :feeds, :url, unique: true
  end
end
