class StaticPagesController < ApplicationController
  def home
    next_page = params[:next] || nil
    
    if next_page && !next_page.empty?
      next_page = "&after=#{next_page}"
    end
    
    @posts = JSON.parse(RestClient.get("https://graph.facebook.com/#{ENV["FBPAGEID"]}/feed?fields=created_time,picture,story,message,shares&limit=10&access_token=#{ENV["FBACCESSTOKEN"]}#{next_page}"))
    
    puts @posts
    @next = @posts["paging"]["next"].split("after=")[1] rescue nil
    
    if next_page
      render json: [@posts, @next].to_json
    end
  end

  def about
  end

  def adoptable_dogs
    @petfinder_dogs = JSON.parse(RestClient.get("http://api.petfinder.com/shelter.getPets?format=json&key=#{ENV["PETFINDERKEY"]}&id=#{ENV["PETFINDERID"]}"))
  end

  def adoption
  end

  def contact_us
  end

  def foster
  end

  def donate
  end

  def happy_tails
    next_page = params[:next] || nil
    
    if next_page && !next_page.empty?
      next_page = "&after=#{next_page}"
    end
    
    
    @images = JSON.parse(RestClient.get("https://graph.facebook.com/#{ENV["FBALBUMID"]}/photos?fields=source,name&limit=50&access_token=#{ENV["FBACCESSTOKEN"]}#{next_page}"))
    
    @next = @images["paging"]["next"].split("after=")[1] rescue nil
    
    if next_page
      render json: [@images, @next].to_json
    end
  end
  
  def dog
    id = params[:id]
    
    @dog = JSON.parse(RestClient.get("http://api.petfinder.com/pet.get?format=json&id=#{id}&key=#{ENV["PETFINDERKEY"]}&id=#{ENV["PETFINDERID"]}"))
    
  end
end

