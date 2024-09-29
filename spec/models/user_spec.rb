require "rails_helper"

RSpec.describe User, type: :model do
  describe "#valid?" do
    it "campos obrigatórios" do
      user = build(:user, email: "", password: "")

      expect(user).not_to be_valid
      expect(user.errors).to include(:email)
      expect(user.errors).to include(:password)
    end
  end

  describe "#unique?" do
    it "email é único" do
      User.create!(
        email: "unique@email.com",
        password: "p4s$w0rd"
      )

      user = FactoryBot.build(:user, email: "unique@email.com")

      user.valid?
      result = user.errors.include?(:email)

      expect(result).to be true
    end
  end
end
