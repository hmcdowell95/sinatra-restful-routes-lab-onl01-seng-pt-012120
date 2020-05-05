
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end
  
  get '/recipes/new' do
    erb :new
  end
  
  post '/recipes' do
    @recipe = Recipe.create(params)
    if @recipe
      @id = @recipe.id
      redirect "/recipes/#{@id}"
    else
      redirect "/recipes/new"
    end
  end
  
  get '/recipes/:id' do 
    @recipe = Recipe.find(params[:id])
    erb :show
  end
  
  get '/recipes/:id/edit' do 
    @recipe = Recipe.find(params[:id])
    erb :edit
  end
  
  patch 'recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(params)
    binding.pry
    erb :show
  end
  
  delete '/recipes/:id' do 
    Recipe.destroy(params[:id])
    erb :index
  end

end
