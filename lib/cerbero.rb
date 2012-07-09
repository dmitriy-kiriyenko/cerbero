require "cerbero/version"

class ActiveRecord::Base
  def save
    super
  rescue
    valid?
    false
  end
end

module Cerbero
  # Your code goes here...
end
