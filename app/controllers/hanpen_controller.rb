class HanpenController < ApplicationController
    
    before_action :authenticate_user!, except:[:index,:whatis,:speak,:show]
    
    def index
    end
    
    def whatis
    end
    
    def speak
        @hanpen=Pen.order("created_at DESC").page(params[:page]).per(50)
    end
    
    def new
    end
    
    def create
    Pen.create(text:hanpen_params[:text], user_id: current_user.id)
    end
    
    def destroy
    hanpen = Pen.find(params[:id])
    hanpen.destroy if hanpen.user_id == current_user.id
    end
  
    def edit
    @hanpen = Pen.find(params[:id])
    end
    
    def update
    hanpen = Pen.find(params[:id])
    if hanpen.user_id == current_user.id
      hanpen.update(hanpen_params)
    end
    end
    
    def show
    @hanpen = Pen.find(params[:id])
    @comments = @hanpen.comments.includes(:user)
    end
  
    private
    def hanpen_params
    params.permit(:text)
    end
    
    def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
