# frozen_string_literal: true

json.array! @stores do |store|
  json.id store.id
  json.name store.name
end
