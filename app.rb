require 'json'
#path = File.join(File.dirname(__FILE__), 'c:/toy/products.json')
path = File.join(File.dirname(__FILE__), 'products.json')
file = File.read(path)
products_hash = JSON.parse(file)

# Print today's date

puts "                     _            _       "
puts "                    | |          | |      "
puts " _ __  _ __ ___   __| |_   _  ___| |_ ___ "
puts "| '_ \\| '__/ _ \\ / _` | | | |/ __| __/ __|"
puts "| |_) | | | (_) | (_| | |_| | (__| |_\\__ \\"
puts "| .__/|_|  \\___/ \\__,_|\\__,_|\\___|\\__|___/"
puts "| |                                       "
puts "|_|                                       "


# For each product in the data set:
  # Print the name of the toy
  # Print the retail price of the toy
  # Calculate and print the total number of purchases
  # Calculate and print the total amount of sales
  # Calculate and print the average price the toy sold for
  # Calculate and print the average discount (% or $) based off the average sales price

products_hash["items"].each do |toy|
  
   # Print the name of the toy:
  puts "Toy name:#{toy["title"]}"
   # Print the retail price of the toy:
  retail_price=toy["full-price"]
  puts "Retail price :$#{retail_price}"
   #Calculate the number of purchases
  total_purchases=toy["purchases"].length
  puts "Total number of purchases: #{total_purchases}"
  #Calculate the total sales
    salestotal = 0.00
    toy["purchases"].each do |purchase|
    salestotal += purchase["price"]      # for each purchase, add the price to the sales total
    end
    #print out the total sales value
  puts "Total sales value : $#{salestotal}"
  #Calculate average price
  avprice = 0.00
  avprice = salestotal/total_purchases
  #Display average price
  puts "Average price :$#{avprice}"
  #Calculate discount
  discountval = 0.00
  discountval = retail_price.to_f - avprice.to_f
  puts "Discount :$#{discountval}"
  puts "   "   
end
	puts " _                         _     "
	puts "| |                       | |    "
	puts "| |__  _ __ __ _ _ __   __| |___ "
	puts "| '_ \\| '__/ _` | '_ \\ / _` / __|"
	puts "| |_) | | | (_| | | | | (_| \\__ \\"
	puts "|_.__/|_|  \\__,_|_| |_|\\__,_|___/"
	puts

# For each brand in the data set:
  # Print the name of the brand
  # Count and print the number of the brand's toys we stock
  # Calculate and print the average price of the brand's toys
  # Calculate and print the total revenue of all the brand's toy sales combined
 
 # Create an array of unique brands, then select brand from products_hash
 unique_brands = products_hash["items"].map { |item| item["brand"]}.uniq
  unique_brands.each_with_index do |brand,index|
  brands_toys = products_hash["items"].select { |item| item["brand"]==brand}
  # Set variable values to zero
  full_price_brand=0
  stock_brand = 0
  purchase_price=0
  purchases_hashcount=0
 #For each item in brand hash, calculate stock total and full price
  brands_toys.each {|toy| stock_brand+=toy["stock"].to_i }
  brands_toys.each {|toy| full_price_brand += toy["full-price"].to_f}
  #Calculate average price
  brand_av_price = full_price_brand/stock_brand
  #Calculate revenue
  brands_toys.each {|toy| purchases_hashcount = toy["purchases"]}
  purchases_hashcount.each {|brand| purchase_price+=brand["price"].to_f}

  #puts brand name,toy stock, average price and sales values
  puts "Brand name #{brand}"
  puts "Total stock on hand is #{stock_brand}"
  puts "Average price:$#{brand_av_price.round(2)}"
  puts "Total revenue:$#{purchase_price}"
  puts " "

end