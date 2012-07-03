# This extends String to add the +resourcerize+ method.
class String

  # Dasherizes and downcases a camelcased string. Used for Feed types.
  def resourcerize
    self.gsub(/([a-z])([A-Z])/, '\1-\2').downcase
  end

def constantize
  names = self.split('::')
  names.shift if names.empty? || names.first.empty?

  constant = Object
  names.each do |name|
    constant = constant.const_defined?(name) ? constant.const_get(name) : constant.const_missing(name)
  end
  constant
end
