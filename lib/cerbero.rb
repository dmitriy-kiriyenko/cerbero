require "cerbero/version"

class ActiveRecord::Base
  def save(*args)
    super
  rescue ActiveRecord::StatementInvalid
    valid?
    false
  end
end

module Cerbero
  # Your code goes here...
end
