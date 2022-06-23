class CreateKomments < ActiveRecord::Migration[7.0]
  def change
    create_table :komments do |t|
      t.string  :author
      t.text    :content
      
      t.timestamps
    end
  end
end
