require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative( '../models/merchant.rb' )
require_relative( '../models/items.rb' )

get '/items' do
  @user = User.find(1)
  @items = Item.all()
  erb (:"items/item_index")
end

get '/items/new' do 
  @user = User.find(1)
  @items = Item.all()
  erb (:"items/new_item")
end

post '/items' do
  @user = User.find(1)
  @items = Item.new(params)
  @items.save()
  redirect to("/transaction/new")
end