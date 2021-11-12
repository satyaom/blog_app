class CommentsController < ApplicationController
    
    http_basic_authenticate_with name: "sat", password: "sat", only: :destroy
    before_action :set_blog, only: [:create, :destroy, :index, :update, :edit]

    def index
        redirect_to @blog
    end

    def create
        @comment = @blog.comments.create(comment_params)
        unless @comment.errors.any?
            redirect_to @blog    
        else
            logger.info "Error: #{@comment.errors.full_messages}"
            #render plain: "#{@comment.errors.full_messages}"
            render 'blogs/show'

        end
    end
    # def edit

    # end

    # def update
    #     @comment = @blog.comments.find(params[:id])
    #     @comment.update(comment_params)
    #     redirect_to @blog
    # end

    def destroy
        @comment = @blog.comments.find(params[:id])
        @comment.destroy
        redirect_to @blog
    end

    private
    def set_blog
        @blog = Blog.find(params[:blog_id])
    end
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
    
end
