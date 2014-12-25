class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamps
    end
    reversible do |dir|
      dir.up do
          Genre.create(name:"和食")
          Genre.create(name:"洋食")
          Genre.create(name:"中華")
          Genre.create(name:"定食屋")
          Genre.create(name:"焼き肉")
          Genre.create(name:"海鮮")
          Genre.create(name:"丼もの")
          Genre.create(name:"麺類")
      end
    end
  end
end
