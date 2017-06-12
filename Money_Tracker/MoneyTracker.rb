require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/transaction_controller')
require_relative('controllers/items_controller')
require_relative('controllers/merchant_controller')
require_relative('controllers/user_controller')

get '/' do
  redirect to ("/transactions")
  # erb( :index )
end
