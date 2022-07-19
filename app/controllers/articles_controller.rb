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
    @article_new = Article.new
  end
  # do NOT use #create as an alias; it is used for something

  # load a single, particular Article
  def show
    @article = Article.find(params[:id])
  end

  # create a single, new instance of Article
  def create
    @article_new = Article.new(title: "…", body: "… …")
    
    if @article_new.save
      redirect_to(@article_new)
    else
      render(:new, status: unprocessable_entity)
    end

    #TODO look into params and related permissions: https://api.rubyonrails.org/classes/ActionController/Parameters.html
    #TODO look into #redirect_to and more explicit alternatives to loading the newly created Article object
  end

end
