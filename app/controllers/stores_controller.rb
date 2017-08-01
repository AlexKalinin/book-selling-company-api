# frozen_string_literal: true

class StoresController < ApplicationController
  def available_books_by_publisher
    publisher = Publisher.find_by!(name: params[:publisher_name])
    @stores = Store.with_available_books_by_publisher(publisher)
  end
end
