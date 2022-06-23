class ArticlesController < ApplicationController
  def hello
    @message = "Hello there!"
  end

  # display all
  def index
    @articles_all = Article.all
  end

  # a new one
  def new
    @article = Article.new
  end
  # do NOT use #create as an alias; it is used for something

  # load a single, particular Article object
  def show
    @article = Article.find(params[:id])
  end

  def create
    a = Article.new(params[:article])
    a.save

    # look into params and related permissions: https://api.rubyonrails.org/classes/ActionController/Parameters.html
    # look into #redirect_to and more explicit alternatives to loading the newly created Article object
  end

end
