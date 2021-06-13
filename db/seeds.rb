User.destroy_all
Book.destroy_all
List.destroy_all

user_1 = User.create(name: 'James')
book_1 = Book.create(author: 'Augusten Burroughs', title: 'Running with Scissors', publisher: 'Picador')
book_2 = Book.create(author: 'Augusten Burroughs', title: 'Dry', publisher: 'St. Martins Press')
list_1 = List.create(user_id: 1, book_id: 1)
list_2 = List.create(user_id: 1, book_id: 2)
