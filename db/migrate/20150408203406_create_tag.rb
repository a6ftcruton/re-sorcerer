class CreateTag < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title
      t.references :taggable, polymorphic: true, index: true
    end
  end
end
