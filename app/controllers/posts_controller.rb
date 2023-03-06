class PostsController < ApplicationController
  require "date"
  # before_action :authenticate_user
  before_action :ensure_correct_user,{only: [:edit, :update, :destroy]}
  
  def index
    @posts = Post.all.order(created_at: :desc)
    @emojis = Emoji.all
    @likes_count = Like.all
    @quote_count = Post.all
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @emojis = Emoji.all
    @likes_count = Like.where(post_id: @post.id).count
  end
  
  def new
    @post = Post.new
    @emojis = Emoji.all
  end
  
  def create
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id
    )
    if params[:image]
      @post.image_name = "#{rand(100000000000)}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image_name}",image.read)
    end
    if params[:image1]
      @post.image_name1 = "#{rand(100000000000)}.jpg"
      image = params[:image1]
      File.binwrite("public/post_images/#{@post.image_name1}",image.read)
    end
    if params[:image2]
      @post.image_name2 = "#{rand(100000000000)}.jpg"
      image = params[:image2]
      File.binwrite("public/post_images/#{@post.image_name2}",image.read)
    end
    if params[:image3]
      @post.image_name3 = "#{rand(100000000000)}.jpg"
      image = params[:image3]
      File.binwrite("public/post_images/#{@post.image_name3}",image.read)
    end
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end

  def quote
    @post = Post.find_by(id: params[:id])
    @emojis = Emoji.all
  end

  def index_quote
    @post = Post.find_by(id: params[:id])
    @emojis = Emoji.all
  end
  
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
  
  def quote_post
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id,
      quote_id: params[:quote]
    )
    if params[:image]
      @post.image_name = "#{rand(100000000000)}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image_name}",image.read)
    end
    if params[:image1]
      @post.image_name1 = "#{rand(100000000000)}.jpg"
      image = params[:image1]
      File.binwrite("public/post_images/#{@post.image_name1}",image.read)
    end
    if params[:image2]
      @post.image_name2 = "#{rand(100000000000)}.jpg"
      image = params[:image2]
      File.binwrite("public/post_images/#{@post.image_name2}",image.read)
    end
    if params[:image3]
      @post.image_name3 = "#{rand(100000000000)}.jpg"
      image = params[:image3]
      File.binwrite("public/post_images/#{@post.image_name3}",image.read)
    end
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end
  
  def index_quote_post
    @post = Post.new(
      content: params[:content],
      user_id: @current_user.id,
      quote_id: params[:quote]
    )
    if params[:image]
      @post.image_name = "#{rand(100000000000)}.jpg"
      image = params[:image]
      File.binwrite("public/post_images/#{@post.image_name}",image.read)
    end
    if params[:image1]
      @post.image_name1 = "#{rand(100000000000)}.jpg"
      image = params[:image1]
      File.binwrite("public/post_images/#{@post.image_name1}",image.read)
    end
    if params[:image2]
      @post.image_name2 = "#{rand(100000000000)}.jpg"
      image = params[:image2]
      File.binwrite("public/post_images/#{@post.image_name2}",image.read)
    end
    if params[:image3]
      @post.image_name3 = "#{rand(100000000000)}.jpg"
      image = params[:image3]
      File.binwrite("public/post_images/#{@post.image_name3}",image.read)
    end
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/#{@post.quote_id}")
    else
      render("posts/new")
    end
  end
end
