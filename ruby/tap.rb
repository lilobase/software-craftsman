#before refactoring
class GeoSystem
  def compute_distance location, coordinates_to
    location.distance_to(coordinates_to)
    location #implicit return
  end
end

class User::Factory
  def self.create_from_hash hash
    user = User.new
    user.name = hash[:name]
    user.family_name = hash[:family_name]
    user #implicit return
  end
end

#after refactoring
class GeoSystem
  def add_distance location, coordinates_to
    location.tap { |o| o.distance_to(coordinates_to) }
  end
end

class User::Factory
  def self.create_from_hash hash
    User.new.tap do |user|
      user.name = hash[:name]
      user.family_name = hash[:family_name]
    end
  end
end