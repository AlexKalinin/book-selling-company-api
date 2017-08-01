require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe 'PUT #mark_as_sold' do
    let (:book_a) { create :book }
    let (:book_b) { create :book }
    let (:book_c) { create :book }
    let (:store_a) { create :store }
    let (:store_b) { create :store }

    before :each do
      Stock.create book: book_a, store: store_a, amount: 10
      Stock.create book: book_b, store: store_a, amount: 10
      Stock.create book: book_c, store: store_a, amount: 10

      Stock.create book: book_a, store: store_b, amount: 11
      Stock.create book: book_b, store: store_b, amount: 11
      Stock.create book: book_c, store: store_b, amount: 11
    end

    def store_books_amounts(store_id, book_ids)
      Stock.select(:amount).where('book_id in (?) AND store_id = ?', book_ids, store_id).pluck(:amount)
    end

    it 'will mark only book_a and book_b as sold only for store_a' do
      books_ids = [book_a.id, book_b.id]
      all_books_ids = [book_a.id, book_b.id, book_c.id]

      put :mark_as_sold, params: { id: store_a.id, books_ids: books_ids }

      expect(response).to have_http_status(:success)
      expect(store_books_amounts(store_a.id, all_books_ids)).to eql [0, 0, 10]
      expect(store_books_amounts(store_b.id, all_books_ids)).to eql [11, 11, 11]
    end
  end

end
