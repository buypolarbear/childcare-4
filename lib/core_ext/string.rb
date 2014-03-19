String.class_eval do
  def possessive
    string + ('s' == string[-1,1] ? "'" : "'s")
  end
end