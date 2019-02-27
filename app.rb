require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end
    
    get '/new' do
      erb :'pirates/new'
    end
    
    post '/pirates' do
      @pirate = Pirate.new(params[:pirate])
     
      params[:pirate][:ships].each do |details|
        Ship.new(details)
      end
     
      @ship = Ship.all
      
      @ship_name_1 = @ship[0].name
      @ship_type_1 = @ship[0].type
      @ship_booty_1 = @ship[0].booty
      @ship_name_2 = @ship[1].name
      @ship_type_2 = @ship[1].type
      @ship_booty_2 = @ship[1].booty
      
      erb :'pirates/show'
    end

  end
end
