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

end