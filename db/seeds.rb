# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Seed the RottenPotatoes DB with some movies.
more_movies = [
  { title: 'My Neighbor Totoro', rating: 'G',
    release_date: '16-Apr-1988',
    description: "This acclaimed animated tale by director Hayao Miyazaki follows schoolgirl Satsuke and her younger sister, Mei, as they settle into an old country house with their father and wait for their mother to recover from an illness in an area hospital. As the sisters explore their new home, they encounter and befriend playful spirits in their house and the nearby forest, most notably the massive cuddly creature known as Totoro." },
  { title: 'Green Book', rating: 'PG-13',
    release_date: '16-Nov-2018',
    description: "Dr. Don Shirley is a world-class African-American pianist who's about to embark on a concert tour in the Deep South in 1962. In need of a driver and protection, Shirley recruits Tony Lip, a tough-talking bouncer from an Italian-American neighborhood in the Bronx. Despite their differences, the two men soon develop an unexpected bond while confronting racism and danger in an era of segregation." },
  { title: 'Parasite', rating: 'R',
    release_date: '30-May-2019',
    description: "Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan." },
  { title: 'Nomadland', rating: 'R',
    release_date: '19-Feb-2021',
    description: "A woman embarks on a journey through the American West after losing everything during the recession." },
  { title: 'CODA', rating: 'PG-13',
    release_date: '13-Aug-2021',
    description: "Seventeen-year-old Ruby (Emilia Jones) is the sole hearing member of a deaf family -- a CODA, child of deaf adults. Her life revolves around acting as interpreter for her parents (Marlee Matlin, Troy Kotsur) and working on the family's struggling fishing boat every day before school with her father and older brother (Daniel Durant). But when Ruby joins her high school's choir club, she discovers a gift for singing and soon finds herself drawn to her duet partner Miles (Ferdia Walsh-Peelo). Encouraged by her enthusiastic, tough-love choirmaster (Eugenio Derbez) to apply to a prestigious music school, Ruby finds herself torn between the obligations she feels to her family and the pursuit of her own dreams.
    Content expanded." },
  { title: 'The Matrix', rating: 'R',
    release_date: '31-Mar-1999',
    description: "Neo (Keanu Reeves) believes that Morpheus (Laurence Fishburne), an elusive figure considered to be the most dangerous man alive, can answer his question -- What is the Matrix? Neo is contacted by Trinity (Carrie-Anne Moss), a beautiful stranger who leads him into an underworld where he meets Morpheus. They fight a brutal battle for their lives against a cadre of viciously intelligent secret agents. It is a truth that could cost Neo something more precious than his life." },
  { title: 'The Shining', rating: 'R',
    release_date: '23-May-1980',
    description: "Jack Torrance (Jack Nicholson) becomes winter caretaker at the isolated Overlook Hotel in Colorado, hoping to cure his writer's block. He settles in along with his wife, Wendy (Shelley Duvall), and his son, Danny (Danny Lloyd), who is plagued by psychic premonitions. As Jack's writing goes nowhere and Danny's visions become more disturbing, Jack discovers the hotel's dark secrets and begins to unravel into a homicidal maniac hell-bent on terrorizing his family." },
  { title: 'Mulholland Dr.', rating: 'R',
    release_date: '19-Oct-2001',
    description: "A dark-haired woman (Laura Elena Harring) is left amnesiac after a car crash. She wanders the streets of Los Angeles in a daze before taking refuge in an apartment. There she is discovered by Betty (Naomi Watts), a wholesome Midwestern blonde who has come to the City of Angels seeking fame as an actress. Together, the two attempt to solve the mystery of Rita's true identity. The story is set in a dream-like Los Angeles, spoilt neither by traffic jams nor smog." }

]

# seed the data base

# Movie.destroy_all # start fresh (delete later)

# prevent duplicated data when seeded
more_movies.each do |movie_data|
  Movie.find_or_create_by(title: movie_data[:title]) do |movie|
    movie.rating = movie_data[:rating]
    movie.release_date = movie_data[:release_date]
    movie.description = movie_data[:description]
  end
end
