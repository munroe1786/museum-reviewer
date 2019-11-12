class CommentsController < Sinatra::Base 

post '/reviewpages/:reviewpage_id/comments' do
    @reviewpage = Reviewpage.find_by_id(params[:reviewpage_id])
    if @reviewpage
       @reviewpage.comments.create(content: params[:content])
       redirect "/reviewpages/#{@reviewpage.id}"
    else
       redirect "/reviewpages"
    end
end

patch '/reviewpages/comments/:id' do
    @reviewpage = current_user.reviewpages.find_by_id(params[:id])
    redirect "/reviewpages" unless @reviewpage
    authorize_user_for(@reviewpage)
    if @reviewpage
        @reviewpage.comments.update(content: params[:content])
      redirect "/reviewpages/#{@reviewpage.id}"
    else
      @error = "Unable to save review due to the following error(s): #{@reviewpage.errors.full_messages.to_sentence}"
      erb :"reviewpages/edit.html"
    end
  end
end