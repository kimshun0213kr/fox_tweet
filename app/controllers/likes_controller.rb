class LikesController < ApplicationController
    # before_actionに「:authenticate_user」を追加してください
    before_action :authenticate_user
    
    # createアクションを追加してください
    def create
        @like = Like.new(
            user_id: @current_user.id,
            post_id: params[:post_id]
        )
        @like.save
        redirect_to("/posts/#{params[:post_id]}")
    end
    
    def destroy
        @like = Like.find_by(
            user_id:@current_user.id,
            post_id:params[:post_id]
        )
        @like.destroy
        redirect_to("/posts/#{params[:post_id]}")
    end
    
    def index_create
        @like = Like.new(
            user_id: @current_user.id,
            post_id: params[:post_id]
        )
        @like.save
        redirect_to("/posts/index")
    end
    
    def index_destroy
        @like = Like.find_by(
            user_id:@current_user.id,
            post_id:params[:post_id]
        )
        @like.destroy
        redirect_to("/posts/index")
    end

    def users_create
        @like = Like.new(
            user_id: @current_user.id,
            post_id: params[:post_id]
        )
        @like.save
        redirect_to("/users/#{params[:post_id.user.id]}")
    end
    
    def users_destroy
        @like = Like.find_by(
            user_id:@current_user.id,
            post_id:params[:post_id]
        )
        @like.destroy
        redirect_to("/posts/index")
    end
end