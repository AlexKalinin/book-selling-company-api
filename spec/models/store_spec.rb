# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store, type: :model do
  it { should have_many(:stocks) }
  it { should have_many(:books) }

  describe 'fetch list of stores which have available books from a particular publisher' do
    let(:publisher_a) { create :publisher }
    let(:publisher_b) { create :publisher }
    let(:book_a) { create :book, publisher: publisher_a }
    let(:book_b) { create :book, publisher: publisher_a }
    let(:book_c) { create :book, publisher: publisher_a }
    let(:book_d) { create :book, publisher: publisher_b }
    let(:store_a) { create :store }
    let(:store_b) { create :store }
    let(:store_c) { create :store }
    let(:store_d) { create :store }

    before :each do
      Stock.create book: book_a, store: store_a, amount: 3
      Stock.create book: book_b, store: store_a, amount: 0
      Stock.create book: book_c, store: store_b, amount: 5
      Stock.create book: book_d, store: store_a, amount: 5
      Stock.create book: book_a, store: store_c, amount: 6
      Stock.create book: book_a, store: store_d, amount: 0
    end

    it 'see in results expected stores' do
      store_ids = Store.with_available_books_by_publisher(publisher_a).ids
      expect(store_ids).to include store_a.id
      expect(store_ids).to include store_b.id
      expect(store_ids).to include store_c.id
    end

    it "don't see in results unexpected stores" do
      store_ids = Store.with_available_books_by_publisher(publisher_a).ids
      expect(store_ids).not_to include store_d.id
    end
  end

  describe 'mark list of books as sold for a particular shop' do
    let(:book_a) { create :book }
    let(:book_b) { create :book }
    let(:book_c) { create :book }
    let(:store_a) { create :store }

    before :each do
      Stock.create book: book_a, store: store_a, amount: 10
      Stock.create book: book_b, store: store_a, amount: 10
      Stock.create book: book_c, store: store_a, amount: 10
    end

    def store_books_amounts(store_id, book_ids)
      Stock.select(:amount).where('book_id in (?) AND store_id = ?', book_ids, store_id).pluck(:amount)
    end

    it 'sell a-c books for store_a' do
      book_ids = [book_a.id, book_b.id, book_c.id]
      expect(store_books_amounts(store_a.id, book_ids)).to eql [10, 10, 10]
      store_a.mark_books_as_sold book_ids
      expect(store_books_amounts(store_a.id, book_ids)).to eql [0, 0, 0]
    end
  end
end
