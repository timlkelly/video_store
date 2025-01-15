class ServiceResponse
  module Status
    ERROR = :error
    SUCCESS = :success
  end

  def self.error(message: nil, payload: {})
    new(status: Status::ERROR, message: message, payload: payload)
  end

  def self.success(message: nil , payload: {})
    new(status: Status::SUCCESS, message: message, payload: payload)
  end

  attr_reader :status, :message, :payload

  def initialize(status:, message: nil, payload: {})
    @status = status
    @message = message
    @payload = payload
  end

  def success?
    status == Status::SUCCESS
  end

  def error?
    status == Status::ERROR
  end

  def errors
    return [] unless error?

    Array.wrap(message)
  end
end
