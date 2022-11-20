class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:show, :edit, :create, :update, :destroy]

  def hello
    @message = "Hello there!"
  end

  # display all
  def index
    @articles_all = Article.all
  end
  
  # load a single, particular Article
  def show
    # before_action
  # rescue ActiveRecord::RecordNotFound#, ActionController::UrlGenerationError #TODO: resolve this and request specs.
  #   redirect_to(articles_path, notice: "Article not found.")
  # rescue ActionController::UrlGenerationError
  #   redirect_to(articles_path, notice: "Article not found.")
  end
  alias_method(:fetch_article, :show)

  # a new article is **only** instantiated, not saved
  def new
    @article = Article.new
  end

  # create a single, new instance of Article
  def create
    # before_action
    
    if @article.save
      redirect_to(@article)
    else
      render(:new, status: :unprocessable_entity)
    end
  end

  # edit a single, particular instance of Article
  def edit
    # before_action
  end

  def update
    # before_action

    if @article.update(article_params)
      redirect_to(@article)
    else
      render(:edit, status: :unprocessable_entity)
    end
  end

  # delete a single, particular instance of Article
  def destroy
    # before_action
    if @article.destroy
      flash[:notice] = "Article \"#{@article.title}\" has been deleted."
      redirect_to(articles_path)
      # redirect_to(root_path, status: :see_other)
    else
      flash[:notice] = "Article \"#{@article.title}\" could NOT be deleted."
    end
  end


  private
  def article_params
    params.require(:article).permit(:title, :body)
  end

  private
  def set_article
    @article ||= Article.find(params[:id])
  end

end #class ArticlesController
