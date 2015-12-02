class Robot
  attr_reader :name,
              :city,
              :state,
              :avatar,
              :birthdate,
              :hired_on,
              :department

  def initialize(data)
    @name       = data['name']
    @city       = data['city']
    @state      = data['state']
    @avatar     = data['avatar']
    @birthdate  = data['birthdate']
    @hired_on   = data['hired_on']
    @department = data['department']
  end
end
