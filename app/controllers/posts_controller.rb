class PostsController < ApplicationController
    def index
        @posts = Post.all
        @post = Post.new
    end

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if (@post.update(post_params_bullshit))
            redirect_to @post     
        else
            render "edit"
        end
    end

    def create
        #render plain: params[:newPost].inspect
        @post = Post.new(post_params)
        if (@post.save)
            redirect_to @post     
        else
            render "new"
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    private def post_params
        params.require(:newPost).permit(:title, :content)
    end

    private def post_params_bullshit
        params.require(:post).permit(:title, :content)
    end
end
