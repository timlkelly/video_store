class ServiceResponse
  module Status
    ERROR = :error
    SUCCESS = :success
  end

  def self.error(message: nil, errors: {}, payload: {})
    new(status: Status::ERROR, message: message, errors: errors, payload: payload)
  end

  def self.success(message: nil , payload: {})
    new(status: Status::SUCCESS, message: message, payload: payload)
  end

  attr_reader :status, :message, :errors, :payload

  def initialize(status:, message: nil, errors: {}, payload: {})
    @status = status
    @message = message
    @errors = errors
    @payload = payload
  end

  def success?
    status == Status::SUCCESS
  end

  def error?
    status == Status::ERROR
  end
end
