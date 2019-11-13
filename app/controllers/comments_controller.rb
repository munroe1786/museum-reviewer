class CommentsController < ApplicationController

post '/reviewpages/:reviewpage_id/comments' do
    redirect_if_not_logged_in
    @reviewpage = Reviewpage.find_by_id(params[:reviewpage_id])
    if @reviewpage && !params[:content].empty?
       @reviewpage.comments.create(content: params[:content])
       redirect "/reviewpages/#{@reviewpage.id}"
    else
       flash[:error] = "Comment field cannot be empty"
       redirect "/reviewpages"
    end
end

patch '/reviewpages/:reviewpage_id/comments/:id' do
    redirect_if_not_logged_in
    @reviewpage = Reviewpage.find_by_id(params[:reviewpage_id])
    redirect "/reviewpages" unless @reviewpage
    #authorize_user_for(@reviewpage)
    @comment = Comment.find_by_id(params[:id])
    authorize_user_for(@comment)
    if @comment
       @comment.update(content: params[:content])
      redirect "/reviewpages/#{@reviewpage.id}"
    else
      @error = "Unable to save comment due to the following error(s): #{@reviewpage.errors.full_messages.to_sentence}"
      erb :"reviewpages/edit.html"
    end
  end

  delete '/reviewpages/:reviewpage_id/comments/:id' do
    #redirect_if_not_logged_in
    @reviewpage = Reviewpage.find_by_id(params[:reviewpage_id])
    redirect "/reviewpages" unless @reviewpage
    @comment = Comment.find_by_id(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      flash[:success] = "Comment deleted successfully"
      redirect "/reviewpages/#{@reviewpage.id}"
    else
      flash[:error] = "You don't have permission to delete this comment"
      redirect "/reviewpages"
    end
  end
end