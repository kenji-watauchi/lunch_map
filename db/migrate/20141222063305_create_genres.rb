class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamps
    end
    reversible do |dir|
      dir.up do
          execute('INSERT INTO genres(name) VALUES("和食")')
          execute('INSERT INTO genres(name) VALUES("洋食")')
          execute('INSERT INTO genres(name) VALUES("中華")')
          execute('INSERT INTO genres(name) VALUES("定食屋")')
          execute('INSERT INTO genres(name) VALUES("焼き肉")')
          execute('INSERT INTO genres(name) VALUES("海鮮")')
          execute('INSERT INTO genres(name) VALUES("丼もの")')
          execute('INSERT INTO genres(name) VALUES("麺類")')
      end
    end
  end
end
