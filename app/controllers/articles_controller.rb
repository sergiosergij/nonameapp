class ArticlesController < ApplicationController
    before_action :set_article, only: %i[show update edit]    

    def index
        @articles = Article.all
    end

    def show; end

    def new
        @article = Article.new
    end

    def create
        @article = current_user.articles.new(article_params)
        if @article.save 
             redirect_to @article 
        else 
            render "new", status: :unprocessable_entity 
        end
    end

    def edit; end

    def update 
        if current_user.articles.find(params[:id])
            @article.update(article_params)  
            redirect_to article_path(set_article)
        else
            redirect_to articles_path
        end 
    end

    def destroy
        @article = current_user.articles.find(params[:id]).destroy
        redirect_to root_path, status: :see_other
    end

    def my_articles
        @articles = current_user.articles.all
    end

    def delete_files
        @article = current_user.articles.find(params[:id]).files.purge
        redirect_to article_path(@article), status: :see_other
    end

    private

    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
       params.require(:article).permit(:title, :body, files: [])
    end

end
