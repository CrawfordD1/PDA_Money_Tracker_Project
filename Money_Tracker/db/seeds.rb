require_relative '../models/transactions'
require_relative '../models/items'
require_relative '../models/user'
require_relative '../models/merchant'

user1 = User.new({
  'name' => 'Crawford',
  'balance' => 100
  })

user1.save()

merchant1 = Merchant.new({
  'name' => 'Tesco'
  })
merchant2 = Merchant.new({
  'name' => 'Amazon'
  })
merchant3 = Merchant.new({
  'name' => 'Netflix'
  })

merchant1.save()
merchant2.save()
merchant3.save()


item1 = Item.new({ 
  'type' => 'Food & drink', 'total' => 20 
  })
item2 = Item.new({ 
  'type' => 'Headphones', 'total' => 0
  })
item3 = Item.new({ 
  'type' => 'Monthly subscription' , 'total' => 0
  })


item1.save()
item2.save()
item3.save()

transaction1 = Transaction.new({
  'amount' => 20,
  'purchase_date' => 'March 4 17',
  'merchant_id' => merchant1.id,
  'item_id' => item1.id
  })

 transaction1.save()


























