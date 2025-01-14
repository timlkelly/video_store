module Resolvers
  class MovieResolver < BaseResolver
    type [Types::Movies::Movie], null: true

    def resolve
      Movie.all
    end
  end
end
