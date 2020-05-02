users = [
{username: "cave_hunter", email: "cave@dragons.com", password: "cavedin"},
{username: "drago", email: "dragons@dragons.com", password: "dragonsedge"},
{username: "dndfiend", email: "dungeons@dragons.com", password: "ttrpger"}
]

users.each do |user|
  User.create(user)
end

items = [
{title: "newspaper", character: "Caleb Widogast", description: "fire starter", date: "05-01-2020", user_id: 1},
{ }
]

items.each do |item|
  Item.create(item)
end