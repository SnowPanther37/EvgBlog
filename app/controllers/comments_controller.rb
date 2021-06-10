class CommentsController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "qwerty"
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        if @comment.save
            flash[notice] = "comment created"
            redirect_to post_path(@post)
        else
            flash[:error] = "Error creating comment"
            redirect_to post_path(@post)
        end
    end

    def edit
        @post = Comment.find(params[:post_id])
    end

    private def comment_params
        params.require(:comment).permit(:username, :body)
    end


end
