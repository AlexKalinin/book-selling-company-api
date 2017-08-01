#frozen_string_literal: true

FactoryGirl.define do
  factory(:book) do
    name { FFaker::Book.title }
    publisher
  end
end
