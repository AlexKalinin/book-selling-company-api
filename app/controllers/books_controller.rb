# frozen_string_literal: true

class BooksController < ApplicationController
  def mark_as_sold
    Store.find(params[:id]).mark_books_as_sold(params[:books_ids])
  end
end
