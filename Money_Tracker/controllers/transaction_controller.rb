require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/transactions.rb' )
require_relative( '../models/merchant.rb' )
require_relative( '../models/items.rb' )
require_relative( '../models/user.rb' )


get '/transactions' do
  @user = User.find(1)
  @transactions = Transaction.all()
  erb (:"transactions/transaction_index")
end

get '/transactions/showall' do
  @user = User.find(1)
  @transactions = Transaction.all()
  erb (:"transactions/all_transactions")
end

get '/transactions/month/:month' do
  @user = User.find(1)
  @transactions = Transaction.find_by_month(params[:month])
  erb (:"transactions/transaction_index")
end

get '/transaction/new' do
  @user = User.find(1)
@items = Item.all()
@merchants = Merchant.all()
erb (:"transactions/new_transaction")  
end

get '/transaction/:id' do
  @user = User.find(1)
  @transaction = Transaction.find(params[:id])
  erb (:"transactions/single_transaction")
end



get '/transaction/:id/edit' do
  @user = User.find(1)
  @merchants = Merchant.all()
  @items = Item.all()
  @transaction = Transaction.find(params[:id])
  erb (:"transactions/edit_transaction")
end

post '/transactions' do
  @user = User.find(1)
  @transaction = Transaction.new(params)
  @transaction.save
  redirect to("/transactions")
end

post '/transaction/:id' do
  @user = User.find(1)
  @transaction = Transaction.find(params[:id])
  @transaction.update(params)
  redirect to "/transaction/#{params[:id]}"
end

post '/transaction/:id/delete' do
  @user = User.find(1)
  @transaction = Transaction.find(params[:id])
  @transaction.delete()
  redirect to "/transactions"
end





