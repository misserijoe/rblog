class ArticlesController < ApplicationController

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

# *** Pluralize is a rails helper that takes a number and a string as its arguments. If the number is > one, the string will be automatically pluralized.

# *** @article = Article.new was added in the ArticlesController b/c @article would be nil in our view, and calling @article.errors.any? would throw an error.

	def new
		@article = Article.new
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)

		if @article.save
		  redirect_to @article
		else
			render 'new'
		end
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end