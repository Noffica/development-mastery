# model
class Article < ApplicationRecord
  validates(
    :title,
    presence: true,
  )
  validates(
    :body, 
    presence:   true,
    length:     { minimum: 1 },
    uniqueness: { scope: :title }
  )
end
