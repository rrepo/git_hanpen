class UsersController < ApplicationController
    def show
    @nickname = current_user.nickname
    @hanpen = current_user.pens.page(params[:page]).per(5).order("created_at DESC")
    end
end
