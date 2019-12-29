require "rails_helper"

RSpec.describe Entry, type: :model do
  describe "relations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "feelings" do
    it { is_expected.to enumerize(:feeling).in(angry: 0, sad: 1, confused: 2, happy: 3) }
  end
end
