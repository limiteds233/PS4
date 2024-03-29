#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class Order < ActiveRecord::Base
end

get '/' do
	@products = Product.all
	erb :index	
end

get '/about' do
	erb :about	
end


post '/cart' do
  #получаем список параметров и разбираем их

	@orders_input = params[:orders_input]
	@items = parse_orders_input @orders_input

  #выводим сообщение о том, что карта пуста

  if @items.length == 0
    return erb :cart_is_empty
  end

  #выводим список продуктов из корзины

	@items.each do |item|
		item[0] = Product.find(item[0])
  end
  #erb "Hello #{params.inspect}"
   erb :cart

 end

get '/admin' do
  @all_orders = Order.order(id: :desc)
  erb :admin
end


def parse_orders_input orders_input
  s1 = orders_input.split(/,/)

  arr = []

  s1.each do |x|
    s2 = x.split(/\=/)

    s3 = s2[0].split(/_/)

    id = s3[1]
   cnt = s2[1]

    arr2 = [id, cnt]

    arr.push arr2
  end

  return arr
 end


post '/place_order' do
        @order = Order.create params[:order]
       erb :order_placed

end



