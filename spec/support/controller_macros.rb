def login_as(user)
  controller.stub(:authenticate_user!).and_return true
  @request.env["devise.mapping"] = Devise.mappings[:user]
  sign_in user
end

def login_user
  controller.stub(:authenticate_user!).and_return true
  @request.env["devise.mapping"] = Devise.mappings[:user]
  password = SecureRandom.uuid.delete "-"
  user =
    User.create({
                  name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: password,
                  password_confirmation: password
                })
  sign_in user
end
