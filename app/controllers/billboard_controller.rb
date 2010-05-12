class BillboardController < ApplicationController
  def index
	prev = params[:id]
	quotes = Quote.find(:all)
	random = rand(quotes.length)
	while  prev == random
		random = rand(quotes.length)
	end
	@quote = Quote.find(quotes[random])
	respond_to do |format|
		format.html
	end
  end
end
