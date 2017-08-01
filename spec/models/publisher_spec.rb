# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Publisher, type: :model do
  it { should have_many(:books) }
end
