db.movies.update(
    {"director_name" : "Muriel Burch"},
    {$set : {"screenwriter" : "Billy Joe Jr."}},
    {multi: true}
);
db.movies.find({"director_name" : "Muriel Burch"});