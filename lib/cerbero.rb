require "cerbero/version"

class ActiveRecord::Base
  def save
    super
  rescue ActiveRecord::RecordNotUnique, ActiveRecord::StatementInvalid
    valid?
    false
  end
end

module Cerbero
  # Your code goes here...
end
