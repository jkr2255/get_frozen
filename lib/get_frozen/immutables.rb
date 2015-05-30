class TrueClass
  def get_frozen
    true
  end
end

class FalseClass
  def get_frozen
    false
  end
end

class NilClass
  def get_frozen
    nil
  end
end

class Numeric
  def get_frozen
    self
  end
end

class Symbol
  def get_frozen
    self
  end
end