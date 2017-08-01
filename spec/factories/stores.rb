#frozen_string_literal: true

FactoryGirl.define do
  factory(:store) do
    name { FFaker::Address.street_name }
  end
end
