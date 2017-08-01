# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Stock, type: :model do
  it { should belong_to(:store) }
  it { should belong_to(:book) }
end
