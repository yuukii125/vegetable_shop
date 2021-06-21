# 商品データ
products = [
  {name: "トマト", price: 100},
  {name: "きゅうり", price: 200},
  {name: "玉ねぎ", price: 300},
  {name: "なす", price: 400}
]

puts "いらっしゃいませ！商品を選んでください。"

products.each.with_index(1) do |product,i|
  puts "#{i}.#{product[:name]} #{product[:price]}円"
end

print "商品の番号を選択してください>>"
select_product_num = gets.to_i

puts "#{products[select_product_num - 1][:name]}ですね。何個購入しますか？"

print "商品の個数を入力してください>>"
buy_product_num = gets.to_i


if buy_product_num >= 5
  puts "5個以上なので10%割引となります！"
  total_amount = products[select_product_num - 1][:price] * buy_product_num * 0.9
else
  total_amount = products[select_product_num - 1][:price] * buy_product_num
end

puts "合計金額は#{total_amount.floor}円です"
puts "お買い上げありがとうございました！"