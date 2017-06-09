require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative( '../models/items.rb' )

get '/merchants' do
  @merchants = Merchant.all()
  erb (:"merchant/merchant_index")
end

get '/merchants/new' do 
  @merchants = Merchant.all()
  erb (:"merchant/new_merchant")
end

post '/merchants' do
  @merchants = Merchant.new(params)
  @merchants.save
  redirect to("/transaction/new")
end