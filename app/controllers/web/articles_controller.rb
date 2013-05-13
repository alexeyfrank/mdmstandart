class Web::ArticlesController < Web::ApplicationController
  def index
    @articles = Article.web
  end

  def show
    @article = Article.find params[:id]
  end
end
