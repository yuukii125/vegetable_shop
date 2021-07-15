DISCOUNT_RATE = 0.9
FIRST_PRODUCT_NUM = 1
LAST_PRODUCT_NUM = 4
DISCOUNT_PRODUCT_NUM =5

# 商品クラス
class Product
  attr_reader :id, :name, :price
  @@count = 0
  def initialize(product_params)
    @id = @@count += 1
    @name = product_params[:name]
    @price = product_params[:price]
  end
end

class Greengrocer
  attr_reader :products
  def initialize(product_params)
    @products = []
    register_product(product_params)
  end
  
  def register_product(product_params)
    product_params.each do |param|
      @products << Product.new(param)
    end
  end

  def disp_products
    puts "いらっしゃいませ！商品を選んでください。"
    @products.each.with_index(FIRST_PRODUCT_NUM) do |product|
      puts "#{product.id}.#{product.name}(#{product.price}円)"
    end
  end
end

class User
  def choose_product(products)
    while true
      print "商品の番号を選択 >"
      select_product_id = gets.to_i
      @chosen_product = products.find{|product| product.id == select_product_id}
      break if !@chosen_product.nil?
      puts "#{products.first.id}から#{products.last.id}の番号から選んでください。"
    end
  end
end

# 商品データ
product_params1 = [
  {name: "トマト", price: 100},
  {name: "きゅうり", price: 200},
  {name: "玉ねぎ", price: 300},
  {name: "なす", price: 400}
]

greengrocer1 = Greengrocer.new(product_params1)

adding_product_params1 = [
  {name: "パセリ", price: 100},
  {name: "ブロッコリー", price: 300},
  {name: "アスパラガス", price: 200}
]

greengrocer1.register_product(adding_product_params1)
greengrocer1.disp_products

user = User.new
user.choose_product(greengrocer1.products)

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
  if quantity_of_product >= DISCOUNT_PRODUCT_NUM
    puts "#{DISCOUNT_PRODUCT_NUM}個以上なので10%割引となります！"
    total_amount = chosen_product[:price] * quantity_of_product * DISCOUNT_RATE
  else
    total_amount = chosen_product[:price] * quantity_of_product
  end
  puts "合計金額は#{total_amount.floor}円です"
  puts "お買い上げありがとうございました！"
end

chosen_product = choose_product(products)
quantity_of_product = decide_quantity(chosen_product)
purchase_product(chosen_product, quantity_of_product)
