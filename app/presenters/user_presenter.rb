class UserPresenter < User
  def name
    self[:name].gsub(/a/, "x")
  end
end
