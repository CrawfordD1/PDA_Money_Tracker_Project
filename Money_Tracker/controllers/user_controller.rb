require( 'sinatra' )
require( 'sinatra/contrib/all' )

require_relative( '../models/merchant.rb' )
require_relative( '../models/items.rb' )
require_relative( '../models/user.rb' )

get '/user' do
  @user = User.all()
  erb (:"user/user_index")
end

get '/user/:id/edit' do
  @user = User.find(params[:id])
  erb (:"user/edit_user")
end

post '/user/:id' do
  @user = User.find(params[:id])
  @user.update(params)
  redirect to("/transactions")
end