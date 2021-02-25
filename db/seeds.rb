User.create!(
  name: "管理者A",
  email: "admin@example.com",
  password: "jjjjjj",
  password_confirmation: "jjjjjj",
  activated: true,
  admin: true,
)

Category.create!(
  name: "テクノロジー"
)