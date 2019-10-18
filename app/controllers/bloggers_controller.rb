class BloggersController < ApplicationController
  before_action :current_blogger, only: [:show, :edit, :update, :destroy] 
  def index
    @bloggers = Blogger.all
  end

  def new
    @blogger = Blogger.new
    @destination = Destination.all
  end

  def edit
  end

  def show
    @posts = Post.all
    @total_likes = 0
    @blogger.posts.each do |i|
      #this if statement was meant for in the case the post didn't have any likes
      if i.likes == nil
        i.likes = 0
      end
      @total_likes += i.likes
    end
    @most_posts = @blogger.posts.max_by { |x| x.likes}

  end

  def create
    @blogger = Blogger.create(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      flash[:errors] = @blogger.errors.full_messages
      redirect_to new_blogger_path
    end
  end

  def update
    @blogger.update(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      flash[:errors] = @blogger.errors.full_messages
      redirect_to edit_blogger_path
    end
  end

  def destroy
    @blogger.destroy
    redirect_to bloggers_path
  end
  
  private

  def current_blogger
    @blogger = Blogger.find(params[:id])
  end

  def blogger_params
    params.require(:blogger).permit(:name, :age, :bio)
  end
end
