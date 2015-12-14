class ArticlesController < ApplicationController

  before_action :article_id, only: [:edit, :show, :destroy, :update]

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first #temporary
    if @article.save
      flash[:success] = "Article was successfully created!"
      redirect_to article_path(@article)
    else
    #flash[:danger] = "sumting wong"
      render 'new'
    end
  end

  def show
  end

  def destroy
    @article.destroy
    flash[:danger] = "Deleted successfully!"
    redirect_to articles_path
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def article_id
    @article = Article.find(params[:id])
  end

end
