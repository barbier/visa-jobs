class AddUser < ActiveRecord::Migration[8.1]
  def up
    User.create(email_address: "admin@visajobs.com", password: "1234", password_confirmation: "1234")
  end

  def down
    User.delete_all
  end
end
