class Web::Admin::ArticlesController < Web::Admin::ApplicationController
  def index
    @search = Article.ransack params[:q]
    @articles = @search.result.admin.page(params[:page]).per(20)
  end

  def new
    @article = ::Web::Admin::ArticleEditType.new
  end

  def create
    @article = ::Web::Admin::ArticleEditType.new params[:article]
    if @article.save
      flash_success
      redirect_to edit_admin_article_path(@article)
    else
      flash_error
      render :new
    end
  end

  def edit
    @article = ::Web::Admin::ArticleEditType.find params[:id]
  end

  def update
    @article = ::Web::Admin::ArticleEditType.find params[:id]
    if @article.update_attributes params[:article]
      flash_success
      redirect_to edit_admin_article_path(@article)
    else
      flash_error
      render :edit
    end
  end

  def destroy
    @article = ::Web::Admin::ArticleEditType.find params[:id]
    @article.destroy
    flash_success
    redirect_to admin_users_path
  end
end
