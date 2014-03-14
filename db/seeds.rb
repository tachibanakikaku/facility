shops = \
[
 { name: "head office" },
 { name: "tokyo office" },
 { name: "osaka office" }
]
shops.each {|s| Shop.create!(s) }

users = \
[
 { name: "Mike Davis", email: "mike@example.com", shop_ids: [Shop.first.id],
   password: "mike123456", password_confirmation: "mike123456" }
]
users.each {|u| User.create!(u) }
