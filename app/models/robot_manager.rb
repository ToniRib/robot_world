require 'yaml/store'

class RobotManager
  def self.database
    @database ||= YAML::Store.new('db/robot_manager')
  end

  def self.create(robot)
    database.transaction do
      database['robots'] ||= []
      database['total'] ||= 0
      database['total'] += 1
      database['robots'] << { 'id'         => database['total'],
                              'name'       => robot[:name],
                              'city'       => robot[:city],
                              'state'      => robot[:state],
                              'avatar'     => robot[:avatar],
                              'birthday'   => robot[:birthdate],
                              'hired_on'   => robot[:hired_on],
                              'department' => robot[:department]
                            }
    end
  end
end
