require 'yaml/store'
require 'pry'

class RobotManager
  def self.database
    if ENV['RACK_ENV'] == 'test'
      @database ||= Sequel.sqlite('db/robot_manager_test.sqlite3')
    else
      @database ||= Sequel.sqlite('db/robot_manager_development.sqlite3')
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
  end

  def self.all
    database.from(:robots).to_a.map { |data| Robot.new(data) }
  end

  def self.find(id)
    Robot.new(database.from(:robots).where(id: id).to_a.first)
  end

  def self.update(id, data)
    database.from(:robots).where(id: id).update(data)
  end

  def self.delete(id)
    database.from(:robots).where(id: id).delete
  end

  def self.sort_by_location
    all.group_by { |robot| robot.city }.map do |set|
      [set[0], set[1].count]
    end.to_h
  end

  def self.sort_by_year
    all.group_by { |robot| robot.hired_on[0..3] }.map do |set|
      [set[0], set[1].count]
    end.to_h
  end

  def self.sort_by_department
    all.group_by { |robot| robot.department }.map do |set|
      [set[0], set[1].count]
    end.to_h
  end
end
