# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ⇩モデル　     ⇩操作（createでデータの保存している）
Admin.create!(
  #Admin.find_or_create_by!
  #     ↑findを入れないとまた作成をしようとしてエラーが発生してしまう。だがfindがdeviseに対応していない為deviseで用意しているpasswordに反映がされずターミナルでエラーが起きる
  # ActiveRecord::StatementInvalid: SQLite3::SQLException: no such column: admins.password
   email: 'test@test.com',
   password: '123456',
)

Tag.create([
    { tag_type: 'ネイル' },
    { tag_type: '春' },
    { tag_type: '夏'},
    { tag_type: '秋'},
    { tag_type: '冬'},
    { tag_type: 'デート'}
    ])