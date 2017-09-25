class PokemonController < ApplicationController
  def index

    # res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")
    # body = JSON.parse(res.body)
    # puts body["name"] # should be "pikachu"

    # render json: {"message":"ok"}
    # puts "id":body["id"]
    # puts "name":body["name"]
    # puts "types":body["types"]
  end

  def show
    res = HTTParty.get("http://pokeapi.co/api/v2/pokemon/#{params[:id]}/")

    body = JSON.parse(res.body)
    puts body["name"] # should be "pikachu"

    # res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=PkTrUd3mrjd4R3oloAXCNKp3QdWlWQtu&q=#{params[:name]}&rating=g")
    res = HTTParty.get("https://api.giphy.com/v1/gifs/search?api_key=#{ENV["GIPHY_KEY"]}&q=pikachu&rating=g")
    # byebug
    something_else = JSON.parse(res.body)

    gif_url = something_else["data"][0]["url"]
    render json: {"message":"ok",
    "id": body["id"],
    "name": body["name"],
    "type": body["types"][0]["type"]["name"],
    "gif_url": gif_url}
  end

#fugure out type and gif
end
