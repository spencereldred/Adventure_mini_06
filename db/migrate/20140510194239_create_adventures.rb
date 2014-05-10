class CreateAdventures < ActiveRecord::Migration
  def change
    create_table :adventures do |t|
      t.references :library, index: true
      t.string :title
      t.string :author
      t.string :GUID

      t.timestamps
    end
  end
end
