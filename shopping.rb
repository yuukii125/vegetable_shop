# 商品データ
products = [
  {name: "トマト", price: 100},
  {name: "きゅうり", price: 200},
  {name: "玉ねぎ", price: 300},
  {name: "なす", price: 400}
]

DISCOUNT_RATE = 0.9

def disp_products(products)
  puts "いらっしゃいませ！商品を選んでください。"
  products.each.with_index(1) do |product,i|
    puts "#{i}.#{product[:name]} #{product[:price]}円"
  end
end

def choose_product(products)
  while true
    print "商品の番号を選択してください>>"
    select_product_num = gets.to_i
    break if (1..4).include?(select_product_num)
    puts "1~4の番号を入力してください"
  end
  chosen_product = products[select_product_num - 1]
end

def decide_quantity(chosen_product)
  puts "#{chosen_product[:name]}ですね。何個購入しますか？"
  
  while true
    print "商品の個数を入力してください>>"
    buy_product_num = gets.to_i
    break if buy_product_num >= 1
    puts "1個以上選んでください"
  end
  quantity_of_product = buy_product_num
end

def purchase_product(chosen_product, quantity_of_product)
  if quantity_of_product >= 5
    puts "5個以上なので10%割引となります！"
    total_amount = chosen_product[:price] * quantity_of_product * DISCOUNT_RATE
  else
    total_amount = chosen_product[:price] * quantity_of_product
  end
  puts "合計金額は#{total_amount.floor}円です"
  puts "お買い上げありがとうございました！"
end

disp_products(products)
chosen_product = choose_product(products)
quantity_of_product = decide_quantity(chosen_product)
purchase_product(chosen_product, quantity_of_product)