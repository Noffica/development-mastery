class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string      :title
      t.text        :text #greater limit for length
      t.timestamps        #`created_at` and `updated_at` will be added
    end
  end
end
