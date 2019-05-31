class CommentsController < ApplicationController

  http_basic_authenticate_with name: "vaibhav", password: "123", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comments_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    if @comment.destroy
      redirect_to article_path(@article)
    end
  end

  private
    def comments_params
      params.require(:comment).permit(:commenter, :body)
    end
end
