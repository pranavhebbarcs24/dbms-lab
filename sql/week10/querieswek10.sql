Atlas atlas-3aq2tq-shard-0 [secondary] test> db.createCollection("restaurants");
{ ok: 1 }
Atlas atlas-3aq2tq-shard-0 [primary] test> db.restaurants.insertMany([
...
... { name: "Meghna Foods", town: "Jayanagar", cuisine: "Indian", score: 8, address: { zipcode: "10001", street: "Jayanagar“
...
... } },
...
... { name: "Empire", town: "MG Road", cuisine: "Indian", score: 7, address: { zipcode: "10100", street: "MG Road" } },
...
... { name: "Chinese WOK", town: "Indiranagar", cuisine: "Chinese", score: 12, address: { zipcode: "20000", street: "Indiranagar" } },
...
... { name: "Kyotos", town: "Majestic", cuisine: "Japanese", score: 9, address: { zipcode: "10300", street: "Majestic" } },
...
... { name: "WOW Momos", town: "Malleshwaram", cuisine: "Indian", score: 5, address: { zipcode: "10400", street: "Malleshwaram" }
...
... } ])
Uncaught:
SyntaxError: Unterminated string constant. (3:109)

  1 | db.restaurants.insertMany([
  2 |
> 3 | { name: "Meghna Foods", town: "Jayanagar", cuisine: "Indian", score: 8, address: { zipcode: "10001", street: "Jayanagar“
    |                                                                                                              ^
  4 |
  5 | } },
  6 |

Atlas atlas-3aq2tq-shard-0 [primary] test> db.restaurants.insertMany([
...   {
...     name: "Meghna Foods",
...     town: "Jayanagar",
...     cuisine: "Indian",
...     score: 8,
...     address: { zipcode: "10001", street: "Jayanagar" }
...   },
...   {
...     name: "Empire",
...     town: "MG Road",
...     cuisine: "Indian",
...     score: 7,
...     address: { zipcode: "10100", street: "MG Road" }
...   },
...   {
...     name: "Chinese WOK",
...     town: "Indiranagar",
...     cuisine: "Chinese",
...     score: 12,
...     address: { zipcode: "20000", street: "Indiranagar" }
...   },
...   {
...     name: "Kyotos",
...     town: "Majestic",
...     cuisine: "Japanese",
...     score: 9,
...     address: { zipcode: "10300", street: "Majestic" }
...   },
...   {
...     name: "WOW Momos",
...     town: "Malleshwaram",
...     cuisine: "Indian",
...     score: 5,
...     address: { zipcode: "10400", street: "Malleshwaram" }
...   }
... ]);
...
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('693ba630cfd07b891b1e2621'),
    '1': ObjectId('693ba630cfd07b891b1e2622'),
    '2': ObjectId('693ba630cfd07b891b1e2623'),
    '3': ObjectId('693ba630cfd07b891b1e2624'),
    '4': ObjectId('693ba630cfd07b891b1e2625')
  }
}
Atlas atlas-3aq2tq-shard-0 [primary] test> db.restaurants.find({})
[
  {
    _id: ObjectId('693ba630cfd07b891b1e2621'),
    name: 'Meghna Foods',
    town: 'Jayanagar',
    cuisine: 'Indian',
    score: 8,
    address: { zipcode: '10001', street: 'Jayanagar' }
  },
  {
    _id: ObjectId('693ba630cfd07b891b1e2622'),
    name: 'Empire',
    town: 'MG Road',
    cuisine: 'Indian',
    score: 7,
    address: { zipcode: '10100', street: 'MG Road' }
  },
  {
    _id: ObjectId('693ba630cfd07b891b1e2623'),
    name: 'Chinese WOK',
    town: 'Indiranagar',
    cuisine: 'Chinese',
    score: 12,
    address: { zipcode: '20000', street: 'Indiranagar' }
  },
  {
    _id: ObjectId('693ba630cfd07b891b1e2624'),
    name: 'Kyotos',
    town: 'Majestic',
    cuisine: 'Japanese',
    score: 9,
    address: { zipcode: '10300', street: 'Majestic' }
  },
  {
    _id: ObjectId('693ba630cfd07b891b1e2625'),
    name: 'WOW Momos',
    town: 'Malleshwaram',
    cuisine: 'Indian',
    score: 5,
    address: { zipcode: '10400', street: 'Malleshwaram' }
  }
]
Atlas atlas-3aq2tq-shard-0 [primary] test> db.restaurants.find({}).sort({ name: -1 })
[
  {
    _id: ObjectId('693ba630cfd07b891b1e2625'),
    name: 'WOW Momos',
    town: 'Malleshwaram',
    cuisine: 'Indian',
    score: 5,
    address: { zipcode: '10400', street: 'Malleshwaram' }
  },
  {
    _id: ObjectId('693ba630cfd07b891b1e2621'),
    name: 'Meghna Foods',
    town: 'Jayanagar',
    cuisine: 'Indian',
    score: 8,
    address: { zipcode: '10001', street: 'Jayanagar' }
  },
  {
    _id: ObjectId('693ba630cfd07b891b1e2624'),
    name: 'Kyotos',
    town: 'Majestic',
    cuisine: 'Japanese',
    score: 9,
    address: { zipcode: '10300', street: 'Majestic' }
  },
  {
    _id: ObjectId('693ba630cfd07b891b1e2622'),
    name: 'Empire',
    town: 'MG Road',
    cuisine: 'Indian',
    score: 7,
    address: { zipcode: '10100', street: 'MG Road' }
  },
  {
    _id: ObjectId('693ba630cfd07b891b1e2623'),
    name: 'Chinese WOK',
    town: 'Indiranagar',
    cuisine: 'Chinese',
    score: 12,
    address: { zipcode: '20000', street: 'Indiranagar' }
  }
]
Atlas atlas-3aq2tq-shard-0 [primary] test> db.restaurants.find({ "score": { $lte: 10 } }, { _id: 1, name: 1, town: 1, cucuisine: 1 })
[
  {
    _id: ObjectId('693ba630cfd07b891b1e2621'),
    name: 'Meghna Foods',
    town: 'Jayanagar',
    cuisine: 'Indian'
  },
  {
    _id: ObjectId('693ba630cfd07b891b1e2622'),
    name: 'Empire',
    town: 'MG Road',
    cuisine: 'Indian'
  },
  {
    _id: ObjectId('693ba630cfd07b891b1e2624'),
    name: 'Kyotos',
    town: 'Majestic',
    cuisine: 'Japanese'
  },
  {
    _id: ObjectId('693ba630cfd07b891b1e2625'),
    name: 'WOW Momos',
    town: 'Malleshwaram',
    cuisine: 'Indian'
  }
]
Atlas atlas-3aq2tq-shard-0 [primary] test> db.restaurants.aggregate([ { $group: { _id: "$name", average_score: { $avg: "$score" } } }
... ])
[
  { _id: 'Empire', average_score: 7 },
  { _id: 'Chinese WOK', average_score: 12 },
  { _id: 'Meghna Foods', average_score: 8 },
  { _id: 'Kyotos', average_score: 9 },
  { _id: 'WOW Momos', average_score: 5 }
]
Atlas atlas-3aq2tq-shard-0 [primary] test> db.restaurants.find({ "address.zipcode": /^10/ }, { name: 1, "address.street": 1, _id: 0 })
[
  { name: 'Meghna Foods', address: { street: 'Jayanagar' } },
  { name: 'Empire', address: { street: 'MG Road' } },
  { name: 'Kyotos', address: { street: 'Majestic' } },
  { name: 'WOW Momos', address: { street: 'Malleshwaram' } }
