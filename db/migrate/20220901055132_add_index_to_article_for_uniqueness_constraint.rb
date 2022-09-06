class AddIndexToArticleForUniquenessConstraint < ActiveRecord::Migration[7.0]
  def change
    add_index(
      :articles,
      [:title, :body],
      unique: true,
      name: "index_for_unique_combination_of_title_body"
    )
  end
end
