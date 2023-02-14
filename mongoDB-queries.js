// Select the database to use.
//use('local');

//1. db.restaurantes.find({});

//2.db.restaurantes.find({},{restaurant_id: 1, name: 1, borough: 1, cuisine:1 });

//3.db.restaurantes.find({},{_id:0, restaurant_id: 1, name: 1, borough: 1, cuisine:1 });

//4.db.restaurantes.find({},{_id:0, restaurant_id: 1, name: 1, borough: 1, cuisine:1, "address.zipcode":1 });

//5.db.restaurantes.find({ borough:{$in:["Bronx"]}});

//6.db.restaurantes.aggregate([{$match:{ borough:{$in:["Bronx"]}}},{$limit:5}]);

//7.db.restaurantes.aggregate([{$match:{ borough:{$in:["Bronx"]}}}]).skip(5);

//8. db.restaurantes.find( {grades: { $elemMatch: {score: {$gt: 90}}}})

//9. db.restaurantes.find( {grades: { $elemMatch: {score: {$gt: 80, $lt:100}} } } )

//10. db.restaurantes.aggregate([ {$project: {name:1,"address.coord":1}}, {$unwind:"$address.coord"}, {$match: {"address.coord":{$lt:-95.754168}}} ])

//11