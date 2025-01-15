# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    description 'The Root Mutation Type'

    field :create_movie, mutation: Mutations::Movies::CreateMovieMutation,
      description: "Add a new `Movie` to the library"
  end
end
