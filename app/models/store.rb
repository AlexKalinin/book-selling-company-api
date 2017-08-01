class Store < ApplicationRecord
  has_one :stock
  has_many :books, through: :stock
end
