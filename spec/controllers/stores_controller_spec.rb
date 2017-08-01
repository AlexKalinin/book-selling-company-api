require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  render_views

  describe 'GET #available_books_by_publisher' do
    let (:publisher_a) { create :publisher }
    let (:publisher_b) { create :publisher }
    let (:book_a) { create :book, publisher: publisher_a}
    let (:book_a1) { create :book, publisher: publisher_a}
    let (:book_b) { create :book, publisher: publisher_b}
    let (:store_a) { create :store }
    let (:store_b) { create :store }
    let (:store_c) { create :store }
    let (:store_d) { create :store }

    before :each do
      Stock.create book: book_a, store: store_a, amount: 0
      Stock.create book: book_a, store: store_b, amount: 0
      Stock.create book: book_b, store: store_b, amount: 0
      Stock.create book: book_a, store: store_c, amount: 1
      Stock.create book: book_a1, store: store_c, amount: 1
      Stock.create book: book_a, store: store_d, amount: 0
      Stock.create book: book_b, store: store_d, amount: 1
    end

    it 'get only store_c in list' do
      get :available_books_by_publisher, params: { publisher_name: publisher_a.name }
      expect(json.count).to eql 1
      expect(json.first['id']).to eql store_c.id
    end
  end
end
