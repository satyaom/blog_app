class BlogsController < ApplicationController
    http_basic_authenticate_with name: "sat", password: "sat", except: [:index, :show]
    before_action :set_blog, only: %i[show edit update destroy]
    def new
        @blog = Blog.new
    end

    def index
        @blogs = Blog.paginate(page: params[:page], per_page: 5)
    end

    def create
        @blog = Blog.new(blog_params)
        
        if @blog.save
            redirect_to action: 'index'
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
        if @blog.update(blog_params)
            redirect_to action: 'show'
        else
            render :edit
        end
    end

    def destroy
        @blog.destroy
        redirect_to action: 'index'
    end

    private

    def set_blog
        @blog = Blog.find(params[:id])
    end
    
    def blog_params
        params.require(:blog).permit(:title, :text)
    end
end
