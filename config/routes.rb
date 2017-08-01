# frozen_string_literal: true

Rails.application.routes.draw do
  get '/stores/available_books_by_publisher/:publisher_name', to: 'stores#available_books_by_publisher'
  put '/store/:id/books/mark_as_sold', to: 'books#mark_as_sold'
end
