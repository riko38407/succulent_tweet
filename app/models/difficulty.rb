class Difficulty < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '易' },
    { id: 3, name: '中' },
    { id: 4, name: '難' },
  ]
  include ActiveHash::Associations
  has_many :pictorial_books
  end