require 'sinatra/base'

class App < Sinatra::Base

    set :views, Proc.new { File.join(root, "../views/") }

    get '/' do
      erb :'index'
    end

    post '/team' do
      @team = Team.create({name: params[:team][:name], motto: params[:team][:motto]})
      
      @members = params[:team][:members].collect do |att|
        member = Member.create({name: att[:name], power: att[:power], biography: att[:biography]})
        member.team = @team
        member
      end
      erb :'team'
    end

    get '/super_hero/:id' do
      #@member = Member.find(id==params[:id])
      erb :'super_hero'
    end

end
