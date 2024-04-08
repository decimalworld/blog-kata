# frozen_string_literal: true

class ApplicationService
  def self.execute(**args, &)
    new(**args, &).execute
  end

  def initialize(**args, &); end

  def execute
    raise 'implement execute instance method to use'
  end
end
