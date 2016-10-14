class ArticlesController < ApplicationController
  include ArticlesHelper

  def show
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash.notice = "Post was created."
      redirect_to article_path(@article)
    end
  end

  def destroy
    article = Article.find(params[:id])
    article.destroy
    flash.notice = "Post '#{@article.title}' deleted!"
    redirect_to articles_path
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Post '#{@article.title}' updated!"

    redirect_to article_path(@article)
  end
end
