require 'rails_helper'

RSpec.describe Store, type: :model do
  it { should have_one(:stock) }
  it { should have_many(:books) }
end
