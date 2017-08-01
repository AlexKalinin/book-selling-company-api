# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

publisher_a = Publisher.create name: 'Publisher A'
publisher_b = Publisher.create name: 'Publisher B'
book_a = Book.create name: 'book_a of publisher_a of store_a (available)', publisher: publisher_a
book_b = Book.create name: 'book_b of publisher_a of store_a (not available)', publisher: publisher_a
book_c = Book.create name: 'book_c of publisher_a of store_b (available)', publisher: publisher_a
book_d = Book.create name: 'book_d of publisher_b of store_a (available)', publisher: publisher_b
store_a = Store.create name: 'store_a'
store_b = Store.create name: 'store_b'
store_c = Store.create name: 'store_c'
store_d = Store.create name: 'store_d'

Stock.create book: book_a, store: store_a, amount: 3
Stock.create book: book_b, store: store_a, amount: 0
Stock.create book: book_c, store: store_b, amount: 5
Stock.create book: book_d, store: store_a, amount: 5
Stock.create book: book_a, store: store_c, amount: 6
Stock.create book: book_a, store: store_d, amount: 0