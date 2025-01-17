class RobotManagerApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)
  set :method_override, true

  get '/' do
    haml :dashboard
  end

  get '/robots' do
    @robots = RobotManager.all
    haml :index
  end

  get '/robots/new' do
    haml :new
  end

  post '/robots' do
    RobotManager.create(params[:robot])
    redirect '/robots'
  end

  get '/robots/:id' do |id|
    @robot = RobotManager.find(id.to_i)
    haml :show
  end

  get '/robots/:id/pdf' do |id|
    robot = RobotManager.find(id.to_i)
    Prawn::Document.generate("#{robot.name}_information.pdf") do
      text "Robot Information for: #{robot.name}"
      text "Location: #{robot.city}, #{robot.state}"
      text "Birthdate: #{robot.birthdate}"
      text "Hired on: #{robot.hired_on}"
      text "Department: #{robot.department}"
    end
    redirect "/robots/#{id}"
  end

  get '/robots/:id/edit' do |id|
    @robot = RobotManager.find(id.to_i)
    haml :edit
  end

  put '/robots/:id' do |id|
    RobotManager.update(id.to_i, params[:robot])
    redirect "/robots/#{id}"
  end

  delete '/robots/:id' do |id|
    RobotManager.delete(id.to_i)
    redirect '/robots'
  end
end
