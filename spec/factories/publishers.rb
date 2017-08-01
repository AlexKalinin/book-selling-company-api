#frozen_string_literal: true

FactoryGirl.define do
  factory(:publisher) do
    name { FFaker::Company.name }
  end
end
