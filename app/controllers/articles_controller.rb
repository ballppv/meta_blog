class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]

    def show
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params) # article_params from 'private def'
        @article.user = User.first
        if @article.save  
            flash[:notice] = "Article was created successfully."
            redirect_to @article
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @article.update(article_params)
            flash[:notice] = "Article was updated successfully."
            redirect_to @article
        else
            render 'edit'
        end
    end

    def destroy
        @article.destroy
        flash[:notice] = "Article has been deleted."
        redirect_to articles_path, status: :see_other
    end

    private # keyword: any methods or actions under this keyword will available only for this controller
    # doesn't need 'end'

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
end