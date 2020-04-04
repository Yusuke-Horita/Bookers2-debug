class SearchController < ApplicationController
  def search
  	if params[:target] == "user"
  		@users = User.search(params[:keyword], params[:search_method])

  		@user = User.find(current_user.id)
  		@book = Book.new
  		render "users/index"
  	else
  		@books = Book.search(params[:keyword], params[:search_method])

	    @user = User.find(current_user.id)
	    @book = Book.new
	    render "books/index"
  	end
  end
end