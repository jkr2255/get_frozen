require "get_frozen/version"
require "get_frozen/immutables"

class Object
  def get_frozen
    if frozen?
      self
    else
      dup.freeze
    end
  end
end
