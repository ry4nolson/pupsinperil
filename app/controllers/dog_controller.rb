class DogController < ApplicationController
	layout "modal"
	def show
		id = params[:id]
		@dog = JSON.parse(RestClient.get("http://api.petfinder.com/pet.get?format=json&key=#{ENV["PETFINDERKEY"]}&id=#{id}"))
		
		@dog = @dog["petfinder"]["pet"]
		
		@dog["tags"] = []
		@dog["options"] && @dog["options"]["option"].each do |option|
			case option["$t"]
			when "altered"
				@dog["tags"].shift ""
			end
		end
		
		#dumb hack, if there is only 1 breed, it's a hash instead of an array of hashes.
		if @dog["breeds"]["breed"].count == 1
			@dog["breeds"]["breed"] = [@dog["breeds"]["breed"]]
		end
		
	end
end
