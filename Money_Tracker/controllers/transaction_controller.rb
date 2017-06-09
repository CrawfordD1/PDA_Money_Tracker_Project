require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transactions.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/items.rb' )


get '/transactions' do
  @transactions = Transaction.all()
  erb (:"transactions/transaction_index")
end

get '/transaction/new' do
@items = Item.all()
@merchants = Merchant.all()
erb (:"transactions/new_transaction")  
end

get '/transaction/:id' do
  @transaction = Transaction.find(params[:id])
  erb (:"transactions/single_transaction")
end

get '/transaction/:id/edit' do
  @merchants = Merchant.all()
  @items = Item.all()
  @transaction = Transaction.find(params[:id])
  erb (:"transactions/edit_transaction")
end

post '/transactions' do
  @transaction = Transaction.new(params)
  @transaction.save
  redirect to("/transactions")
end

post '/transaction/:id' do
  @transaction = Transaction.find(params[:id])
  @transaction.update(params)
  redirect to "/transaction/#{params[:id]}"
end

post '/transaction/:id/delete' do
  @transaction = Transaction.find(params[:id])
  @transaction.delete()
  redirect to "/transactions"
end





