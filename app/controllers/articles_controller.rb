class ArticlesController < ApplicationController
	include ArticlesHelper


	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		@comment.article_id = @article.id
	end

	def new
		 @article = Article.new
	end

	def create 
		

		@article = Article.new(article_params)
		@article.save
		

		flash.notice = "Article '#{@article.title}' Created!"

		redirect_to article_path(@article)
	end

	def destroy
		@article1 = Article.find(params[:id])

		@article = Article.destroy(params[:id])
		flash.notice = "Article '#{@article1.title}' Destroyed"

		redirect_to action: "index"

	end

	def edit 
		@article = Article.find(params[:id])
		flash.notice = "Article '#{@article.title}' Succesfully edited"
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' Updated!"

		redirect_to article_path(@article)
	end
	
	
end
