class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    @comment = @item.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to item_path(@item), notice: "Comment was successfully created."
    else
      redirect_to item_path(@item), alert: "Failed to create comment."
    end
  end

  def edit
    @item = Item.find(params[:item_id])
    @comment = @item.comments.find(params[:id])
  end

  def update
    @item = Item.find(params[:item_id])
    @comment = @item.comments.find(params[:id])

    if @comment.user == current_user
      if @comment.update(comment_params)
        redirect_to item_path(@item), notice: "Comment was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    else
      redirect_to item_path(@item), alert: "You are not authorized to edit this comment."
    end
  end

  def destroy
    @item = Item.find(params[:item_id])
    @comment = @item.comments.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      redirect_to item_path(@item), notice: "Comment was successfully deleted."
    else
      redirect_to item_path(@item), alert: "You are not authorized to delete this comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
