class ArticlesController < ApplicationController
  
  def hello
    @message = "Hello there!"
  end

  # display all
  def index
    @articles_all = Article.all
  end

  # a new article is **only** instantiated, not saved
  def new
    @article = Article.new
  end
  # do NOT use #create as an alias; it is used for something

  # load a single, particular Article
  def show
    @article = Article.find(params[:id])
  end

  # create a single, new instance of Article
  def create
    @article = Article.new(article_params)
    
    if @article.save
      redirect_to(@article)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  # edit a single, particular instance of Article
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to(@article)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  # delete a single, particular instance of Article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    
    redirect_to(root_path, status: :see_other)
  end


  #TODO look into params and related permissions: https://api.rubyonrails.org/classes/ActionController/Parameters.html
  #TODO look into #redirect_to and more explicit alternatives to loading the newly created Article object

  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

end #class ArticlesController
