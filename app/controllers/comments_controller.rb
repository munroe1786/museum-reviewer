class CommentsController < ApplicationController

  post '/reviewpages/:reviewpage_id/comments' do
    redirect_if_not_logged_in
    @reviewpage = Reviewpage.find_by_id(params[:reviewpage_id])
    if @reviewpage && !params["content"].empty?
       @comment = current_user.comments.create(content: params[:content])
       @comment.reviewpage_id = @reviewpage.id
       @comment.save
       flash[:success] = "Comment created successfully."
       redirect "/reviewpages/#{@reviewpage.id}"
    else
       flash[:error] = "Comment field cannot be empty."
       redirect "/reviewpages"
    end
  end

  get '/reviewpages/:reviewpage_id/comments/:id/edit' do
    redirect_if_not_logged_in
    @reviewpage = Reviewpage.find_by_id(params[:reviewpage_id])
    @comment = Comment.find_by_id(params[:id])
    authorize_user_for(@comment)
    if @comment
      erb :'comments/edit.html'
    else
      redirect "/reviewpages/#{@reviewpage.id}"
    end
  end

  patch '/comments/:id' do
    redirect_if_not_logged_in
    @reviewpage = Reviewpage.find_by_id(params[:reviewpage_id])
    @comment = Comment.find_by_id(params[:id])
    authorize_user_for(@comment)
    if @comment && !params["content"].empty?
       @comment.update(content: params[:content])
       flash[:success] = "Comment updated successfully"
       redirect "/reviewpages"
    else
      flash[:error] = "Unable to edit comment - comment field cannot be blank."
      redirect "/reviewpages"
    end
  end

    delete '/reviewpages/:reviewpage_id/comments/:id' do
        redirect_if_not_logged_in
        @reviewpage = Reviewpage.find_by_id(params[:reviewpage_id])
        @comment = Comment.find_by_id(params[:id])
        redirect "/reviewpages/#{reviewpage.id}" unless @comment
        authorize_user_for(@comment)
        @comment.destroy
        flash[:success] = "Comment deleted successfully"
        redirect "/reviewpages/#{@reviewpage.id}"
    end
end