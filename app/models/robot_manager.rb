require 'yaml/store'
require 'pry'

class RobotManager
  def self.database
    if ENV['RACK_ENV'] == 'test'
      @database ||= Sequel.sqlite('db/robot_manager_test.sqlite3')
    else
      @database ||= Sequel.sqlite('db/robot_manager.sqlite3')
    end
  end

  def self.create(robot)
    database.from(:robots).insert(name: robot[:name],
                                  city: robot[:city],
                                  state: robot[:state],
                                  avatar: robot[:avatar],
                                  birthdate: robot[:birthdate],
                                  hired_on: robot[:hired_on],
                                  department: robot[:department] )
    # database.transaction do
    #   database['robots'] ||= []
    #   database['total'] ||= 0
    #   database['total'] += 1
    #   database['robots'] << { 'id'         => database['total'],
    #                           'name'       => robot[:name],
    #                           'city'       => robot[:city],
    #                           'state'      => robot[:state],
    #                           'avatar'     => robot[:avatar],
    #                           'birthdate'  => robot[:birthdate],
    #                           'hired_on'   => robot[:hired_on],
    #                           'department' => robot[:department]
    #                         }
    # end
  end
  #
  # def self.raw_robots
  #   database.transaction do
  #     database['robots'] || []
  #   end
  # end

  def self.all
    database.from(:robots).to_a.map { |data| Robot.new(data) }
    # raw_robots.map { |data| Robot.new(data) }
  end
  #
  # def self.raw_robot(id)
  #   raw_robots.find { |robot| robot['id'] == id }
  # end

  def self.find(id)
    Robot.new(database.from(:robots).where(id: id).to_a.first)
  end

  def self.update(id, data)
    database.transaction do
      target = database['robots'].find { |robot| robot['id'] == id }
      target['name']       = data[:name]
      target['city']       = data[:city]
      target['state']      = data[:state]
      target['avatar']     = data[:avatar]
      target['birthdate']  = data[:birthdate]
      target['hired_on']   = data[:hired_on]
      target['department'] = data[:department]
    end
  end

  def self.delete(id)
    database.transaction do
     database['robots'].delete_if { |robot| robot['id'] == id }
   end
  end
end
