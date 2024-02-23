# require 'faker'
# Movie.destroy_all

#.times do
#   Movie.create(
  #     title: Faker::Movie.title
  #     overview: Faker::Movies::Avatar.quote,
  #     rating: Faker::Number.within(range: 1..10),
  #     poster_url: 'https://marketplace.canva.com/EAFyI4M7YBQ/1/0/1600w/canva-white-handdrawn-popcorn-snack-logo-ar3G6ivDOv0.jpg',
  #   )
  # end


  require 'json'
  require 'open-uri'


  puts "Cleaning database..."


  Movie.destroy_all
  List.destroy_all


  # URL du endpoint
  url = 'https://tmdb.lewagon.com/movie/top_rated'
  # Lecture des données JSON depuis l'URL
  response = URI.open(url).read
  # Analyse des données JSON
  data = JSON.parse(response)
  # Récupération des résultats
  movies = data['results']
  # Itération à travers les résultats et création des instances de films
  movies.each do |movie_data|
    Movie.create(
      title: movie_data['title'],
      overview: movie_data['overview'],
      poster_url: "https://image.tmdb.org/t/p/original/#{movie_data['poster_path']}",
      rating: movie_data['vote_average']
    )
  end

  Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
  Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
  Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
  Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)


  puts "#{movies.size} films créés avec succès."
  puts Movie.all

