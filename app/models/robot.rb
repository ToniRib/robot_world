class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :avatar,
              :birthdate,
              :hired_on,
              :department

  def initialize(data)
    @id         = data[:id]
    @name       = data[:name]
    @city       = data[:city]
    @state      = data[:state]
    @avatar     = data[:avatar]
    @birthdate  = data[:birthdate]
    @hired_on   = data[:hired_on]
    @department = data[:department]
  end

  def to_s
    "Name: #{name}\n
    Location: #{city}, #{state}\n
    Birthdate: #{birthdate}\n
    Hired On: #{hired_on}\n
    Department: #{department}"
  end
end
