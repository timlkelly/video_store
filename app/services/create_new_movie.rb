class CreateNewMovie
  def self.call(...)
    new(...).call
  end

  def initialize(genre:, title:)
    @genre = genre
    @title = title
  end

  def call
    movie = Movie.create(title: @title, genre: @genre)

    if movie.valid?
      ServiceResponse.success(payload: movie)
    else
      ServiceResponse.error(message: 'Failed to Create Movie')
    end
  rescue ActiveRecord::RecordNotUnique => e
    ServiceResponse.error(message: e.message)
  end
end
