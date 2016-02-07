class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

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

  def edit
	@article = Article.find(params[:id])
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

  def update
	@article = Article.find(params[:id])

	if @article.update(article_params)
	  redirect_to @article
	else
	  render 'edit'
	end
  end

# 'def destroy' must be added BEFORE any 'private' or 'protected' method.
  def destroy
	@article = Article.find(params[:id])
	@article.destroy

	redirect_to articles_path
  end

  private
	def article_params
	  params.require(:article).permit(:title, :text)
	end
end