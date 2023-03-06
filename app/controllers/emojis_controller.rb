class EmojisController < ApplicationController
  # before_action:authenticate_user
  def index
    @emojis = Emoji.all
  end

  def new
    @emoji = Emoji.new
  end

  def create
    if params[:image_gif]
      @emoji = Emoji.new(
        content: params[:content],
        gif:"gif"
      )
    else
      @emoji = Emoji.new(
        content: params[:content]
      )
    end
    if params[:image]
      image = params[:image]
      File.binwrite("public/emoji/#{params[:content]}.png",image.read)
    end
    if params[:image_gif]
      image = params[:image_gif]
      File.binwrite("public/emoji/#{params[:content]}.gif",image.read)
    end
    if @emoji.save
      flash[:notice] = "絵文字を追加しました。"
      redirect_to("/emoji")
    else
      render("emoji/new")
    end
  end
end
