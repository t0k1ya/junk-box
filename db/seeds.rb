User.create!(
  name: "管理者A",
  email: "admin@example.com",
  password: "jjjjjj",
  password_confirmation: "jjjjjj",
  activated: true,
  admin: true,
)

# user = User.find(1)

# 20.times do |n|
#   title = 'Hello World'
#   Article.create!(
#     user: user,
#     title: title,
#     status: 1, # 公開済み
#   )
# end