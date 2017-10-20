Organization.destroy_all
User.destroy_all

Organization.create(name: "Dream Defenders", email: "dd@gmail.com", password: "1234")

Organization.create(name: "The Alliance", email: "alliance@gmail.com", password: "1234", code: "4500")

User.create(first_name: "Bertisha", last_name: "Jones", email: "bertisha@gmail.com", password: "1234")
