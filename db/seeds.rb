users = \
[
  {
    name: "Mike Davis", email: "mike@example.com",
    shop_ids: [], password: "mike123456",
    password_confirmation: "mike123456"
  }
]
users.each { |u| User.create!(u) }

shops = \
[
  { name: "head office" },
  { name: "tokyo shop" },
  { name: "osaka shop" }
]
shops.each { |s| Shop.create!(s) }

rooms = \
[
  { name: "1st conference room" },
  { name: "2nd conference room" }
]
rooms.each { |r| Room.create!(r) }
