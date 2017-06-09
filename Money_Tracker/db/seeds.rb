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
  'name' => 'Tesco',
  'image_link' => 'a'
  })

merchant1.save()

item1 = Item.new({ 
  'type' => 'grocerys' 
  })

item1.save()

transaction1 = Transaction.new({
  'amount' => 20,
  'purchase_date' => 'March 04 17',
  'merchant_id' => merchant1.id,
  'item_id' => item1.id
  })
 transaction1.save()


























