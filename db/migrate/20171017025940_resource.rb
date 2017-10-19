class Resource < ActiveRecord::Migration[5.1]

  def change
    create_table :users do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :username
      t.string :password
      t.string :profilepic
    end

    create_table :sources do |t|
      t.string :title
      t.string :link
      t.string :rtype
      t.string :image
      t.string :text
      t.string :theme
    end

    create_table :profiles do |t|
      t.string :username
      t.string :posts
    end
  end
end
