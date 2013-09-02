class CommentsController < ApplicationController
  def create
    @ticket = Ticket.find(params[:ticket_id])
    @comment = @ticket.comments.create(params[:comment].merge(:user => current_user))
    redirect_to ticket_path(@ticket)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @ticket = Ticket.find(params[:ticket_id])

    redirect_to ticket_path(@ticket)
  end
end
