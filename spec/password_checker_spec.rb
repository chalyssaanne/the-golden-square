require 'password_checker'

RSpec.describe PasswordChecker do

  it "checks if the password length is equal to or more than 8" do
    password = PasswordChecker.new
    expect(password.check("refreshing")).to eq true
  end

  it "fails if the password length is less than 8" do
    password = PasswordChecker.new
    expect { password.check("sweet") }.to raise_error "Invalid password, must be 8+ characters."
  end
end