require 'rails_helper'

RSpec.describe User, :type => :model do
  it "should have many cards" do
    t = User.reflect_on_association(:cards)
    expect(t.macro).to eq(:has_many)
  end
end
