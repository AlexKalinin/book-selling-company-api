# frozen_string_literal: true

class Store < ApplicationRecord
  has_many :stocks
  has_many :books, through: :stocks

  scope :with_available_books_by_publisher, (lambda do |publisher|
    sql = <<-SQL
      SELECT DISTINCT(s.id) FROM stores AS s
        LEFT JOIN stocks AS st ON st.store_id = s.id
        LEFT JOIN books AS b ON st.book_id = b.id
        WHERE st.amount > 0 AND b.id IN (
          SELECT b.id FROM books AS b
            LEFT JOIN publishers AS p ON b.publisher_id = p.id
            WHERE p.id = #{publisher.id}
        );
    SQL
    ids = ActiveRecord::Base.connection.select_all(sql).map { |e| e['id'] }
    where('id IN (?)', ids)
  end)

  def mark_books_as_sold(books_ids)
    stocks.where('book_id IN (?)', books_ids).find_each do |stock|
      stock.update! amount: 0
    end
  end
end
