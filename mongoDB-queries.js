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

//11. db.restaurantes.find({cuisine:{$ne:"American "},"address.coord.0":{$lt:-65.754168},"grades.score":{$gt:70}})

//12. db.restaurantes.find({cuisine:{$ne:"American "},"address.coord.0":{$lt:-65.754168},"grades.score":{$gt:70}})

//13. db.restaurantes.find({cuisine:{$ne:"American "}, "grades.grade":"A", borough:{$ne:"Brooklyn"}}).sort({cuisine:-1})

//14. db.restaurantes.find({name:/^Wil/},{borough:1,cuisine:1,name:1,restaurant_id:1})

//15. db.restaurantes.find({name:/ces$/},{borough:1,cuisine:1,name:1,restaurant_id:1})

//16.  db.restaurantes.find({name:/Reg/},{borough:1,cuisine:1,name:1,restaurant_id:1})

//17. db.restaurantes.find({ borough:"Bronx",$or:[{cuisine:"American "}, {cuisine: "Chinese"}]})

//18. db.restaurantes.find({$or:[{borough:"Bronx"}, {borough:"Queens"}, {borough:"Staten Island"}, {borough:"Brooklyn"}]},{borough:1,cuisine:1,name:1,restaurant_id:1})

//19. db.restaurantes.find( {$and:[{borough:{$ne:"Bronx"}}, {borough:{$ne:"Queens"}}, {borough:{$ne:"Brooklyn"}}, {borough:{$ne:"Staten Island"}}]}, {borough:1,cuisine:1,name:1,restaurant_id:1}  )

//20. db.restaurantes.aggregate([{$project:{ nota:{$avg:"$grades.score"},restaurant_id:1, name:1, borough:1, cuisine:1}}, {$match:{"nota":{$lt:10} }} ])

//21. db.restaurantes.find({$or: [{ cuisine: { $eq: 'Seafood' }},{ cuisine: { $eq: 'American ' }},{ cuisine: { $eq: 'Chinese' }},{ name: RegExp("^Wil")}]}, {restaurant_id:1,cuisine: 1,name: 1, borough:1})

//22. db.restaurantes.find({"grades.score":11, "grades.grade": "A", "grades.date": ISODate('2014-08-11T00:00:00Z')}, {restaurant_id:1,cuisine: 1,name: 1, borough:1})

//23. db.restaurantes.aggregate([ {$project:{ Grau:{$arrayElemAt:["$grades.grade",1] }, name:1, grades:1, restaurant_id:1} }, {$match:{$and:[{Grau:"A"},{grades:{$elemMatch:{score:9}}}, {"grades.date":ISODate('2014-08-11T00:00:00Z')} ]}} ])

//24. 

//25. db.restaurantes.find({},{name:1}).sort({name:1})

//26. db.restaurantes.find({},{name:1}).sort({name:-1})

//27.

//28.

//29.

//30.

//31.

//32.
