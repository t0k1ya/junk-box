User.create!(
  name: "管理者A",
  email: "admin@example.com",
  password: "jjjjjj",
  password_confirmation: "jjjjjj",
  activated: true,
  admin: true,
)

User.all.each do |user|
  100.times do |n|
    user.articles.create!(
      title: "#{n}番目の記事です",    
      content: 'hello',
      status: '1',
      is_deleted: false,
    )
  end
end