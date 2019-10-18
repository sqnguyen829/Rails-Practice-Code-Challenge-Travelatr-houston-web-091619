class PostsController < ApplicationController
    before_action :current_post, only: [:show, :edit, :update, :destroy, :like] 
    
    def index
        @posts = Post.all

    end

    def new
        @post = Post.new
        @destination = Destination.all
        @blogger = Blogger.all
    end

    def edit
    end

    def show
        @blogger = @post.blogger
    end

    def create
        @post = Post.create(post_params)
        
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to new_post_path
        end
    end

    def update
        @post.update(post_params)
        if @post.valid?
            @post.save
            redirect_to post_path(@post)
        else
            flash[:errors] = @post.errors.full_messages
            redirect_to edit_post_path
        end
    end

    #this method updates the like count by one every time the user hits like
    def like
        @post.likes = @post.likes + 1
        @post.save
        redirect_to @post
    end
    
    private

    def current_post
        @post = Post.find(params[:id])
    end

    def post_params
        params.require(:post).permit(:title, :content, :likes,:blogger_id, :destination_id)    
    end

end
