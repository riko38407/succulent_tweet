class Type < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'サボテン科' },
    { id: 3, name: 'エケベリア' },
    { id: 4, name: 'セダム' },
    { id: 5, name: 'カランコエ' },
    { id: 6, name: 'センペルビウム' },
    { id: 7, name: 'その他' },
  ]
  include ActiveHash::Associations
  has_many :pictorial_books
  end