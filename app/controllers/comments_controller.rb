class CommentsController < ApplicationController

post '/reviewpages/:reviewpage_id/comments' do
    redirect_if_not_logged_in
    @reviewpage = Reviewpage.find_by_id(params[:reviewpage_id])
    if @reviewpage
       @reviewpage.comments.create(content: params[:content])
       redirect "/reviewpages/#{@reviewpage.id}"
    else
       redirect "/reviewpages"
    end
end

patch '/reviewpages/:reviewpage_id/comments/:id' do
    redirect_if_not_logged_in
    @reviewpage = Reviewpage.find_by_id(params[:reviewpage_id])
    redirect "/reviewpages" unless @reviewpage
    authorize_user_for(@reviewpage)
    @comment = Comment.find_by_id(params[:id])
    if @comment
       @comment.update(content: params[:content])
      redirect "/reviewpages/#{@reviewpage.id}"
    else
      @error = "Unable to save review due to the following error(s): #{@reviewpage.errors.full_messages.to_sentence}"
      erb :"reviewpages/edit.html"
    end
  end

  delete '/reviewpages/:reviewpage_id/comments/:id' do
    #redirect_if_not_logged_in
    @reviewpage = Reviewpage.find_by_id(params[:reviewpage_id])
    redirect "/reviewpages" unless @reviewpage
    authorize_user_for(@reviewpage)
    @comment = Comment.find_by_id(params[:id])
    #@comment.update(deleted: true)
    @comment.destroy
    flash[:success] = "Comment deleted successfully"
    redirect "/reviewpages/#{@reviewpage.id}"
  end
end