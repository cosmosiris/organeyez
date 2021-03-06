require 'faker'

Organization.destroy_all
User.destroy_all
Membership.destroy_all

dd = Organization.create(name: "Dream Defenders", email: "dd@gmail.com", password: "1234")

Organization.create(name: "The Alliance", email: "alliance@gmail.com", password: "1234", code: "4500")

User.create(first_name: "Bertisha", last_name: "Jones", email: "bertisha@gmail.com", password: "1234")

5.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: "fake_account@gmail.com", password: "1234")
end


dd.memberships.create(member_id: 1)
dd.memberships.create(member_id: 2)
dd.memberships.create(member_id: 3)

