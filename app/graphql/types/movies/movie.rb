module Types
  module Movies
    class Movie < Types::BaseObject
      description 'Movie'

      field :genre, String, description: "The Movie's Genre"
      field :title, String, description: "The title of the Movie"
    end
  end
end
