module Mutations
  module Movies
    class CreateMovieMutation < BaseMutation
      description 'Create a new Movie'

      argument :genre, String, description: "The Movie's title"
      argument :title, String, description: "The Movie's genre"

      field :errors, [String], null: true,
        description: 'Errors encountered during Mutation execution'

      field :movie, Types::Movies::Movie,
        description: "The `Movie` resource participating in the mutation"

      def self.authorized?(object, context)
        # psuedocode
        # if context[:current_user].is_employee?
        #   true
        # else
        #   return false, { errors: ["Only employees can create new Movies"] }
        #   raise GraphQL::ExecutionError, "Only employees can create new Movies"
        # end

        true
      end

      def resolve(genre:, title:)
        response = CreateNewMovie.call(genre: genre, title: title)

        {
          errors: response.errors,
          movie: response.payload
        }
      end
    end
  end
end
