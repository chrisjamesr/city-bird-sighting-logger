users = User.create([
  {username: "Dan", password: "serena"},
  {username: "Nate", password: "jenny"},
  {username: "Blair", password: "chuck"},
  {username: "Jenny", password: "nate"},
  {username: "Vanessa", password: "dan"},
  {username: "Chuck", password: "money"}
  ])

birds = Bird.create([
  {species: "Northern Cardinal"},
  {species: "Tree Swallow"},
  {species: "Common Tern"},
  {species: "Red Tailed Hawk"},
  {species: "Emperor Penguin"},
  {species: "English Sparrow"},
  {species: "Quaker Parrot"},
  {species: "Pigeon"}
  ])

sightings = Sighting.create([
  {user_id: 1, bird_id: 8, location: "East River State Park", time_date: "2017-09-01", description: "Who!"},
  {user_id: 2, bird_id: 7, location: "Backyard", time_date: "2017-11-02", description: "there are several pigeons taunting me"},
  {user_id: 3, bird_id: 6, location: "Rockaway Beach", time_date: "2017-11-25", description: "Tiny birds"},
  {user_id: 4, bird_id: 5, location: "Backyard", time_date: "2017-11-02", description: "Woodpecker"},
  {user_id: 6, bird_id: 4, location: "The Empire", time_date: "2016-12-31", description: "This bird lives here"},
  {user_id: 6, bird_id: 3, location: "The Pierre", time_date: "2016-12-31", description: "This bird is out of place"},
  {user_id: 5, bird_id: 2, location: "Columbia", time_date: "2016-12-31", description: "They fly so fast"},
  {user_id: 4, bird_id: 1, location: "Central Park", time_date: "2017-09-01", description: "Who!"},
  {user_id: 3, bird_id: 1, location: "Astoria Park", time_date: "2017-11-02", description: "Grandma"},
  {user_id: 2, bird_id: 2, location: "The N Train", time_date: "2017-11-25", description: "A whole flock of them!"},
  {user_id: 1, bird_id: 3, location: "Swinburne Island", time_date: "2017-11-25", description: "Divebomb"}
  ])