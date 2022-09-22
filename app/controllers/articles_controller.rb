class ArticlesController < ApplicationController
  
  def hello
    @message = "Hello there!"
  end

  # display all
  def index
    @articles_all = Article.all
  end
  
  # load a single, particular Article
  def show
    @article = Article.find(params[:id])
  end
  alias_method(:fetch_article, :show)

  # a new article is **only** instantiated, not saved
  def new
    @article = Article.new
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
    fetch_article
  end

  def update
    fetch_article

    if @article.update(article_params)
      redirect_to(@article)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  # delete a single, particular instance of Article
  def destroy
    fetch_article.destroy
    redirect_to(root_path, status: :see_other)
  end


  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

end #class ArticlesController
