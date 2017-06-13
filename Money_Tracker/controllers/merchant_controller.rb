require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative( '../models/merchant.rb' )
require_relative( '../models/items.rb' )

get '/merchants' do
  @user = User.find(1)
  @merchants = Merchant.all()
  erb (:"merchant/merchant_index")
end

get '/merchants/new' do 
  @user = User.find(1)
  @merchants = Merchant.all()
  erb (:"merchant/new_merchant")
end

post '/merchants' do
  @user = User.find(1)
  @merchants = Merchant.new(params)
  @merchants.save
  redirect to("/transaction/new")
end

post '/merchants/:id/delete' do
  @user = User.find(1)
  @merchants = Merchant.find(params[:id])
  @merchants.delete()
  redirect to "/merchants"
end