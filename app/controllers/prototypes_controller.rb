class PrototypesController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]
  before_action :set_action, only:[:show, :edit, :update]

  def index
    @prototypes = Prototype.all
  end 

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.create(prototype_params)
    if @prototype.save
      redirect_to root_path 
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    unless current_user.id == @prototype.user_id
      redirect_to action: :show
    end
  end

  def update
    if @prototype.update(prototype_params)
      redirect_to action: :show
    else
      render "prototypes/edit"
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    if prototype.destroy
      redirect_to root_path
    end
  end

private
 def prototype_params
  params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
 end
 def set_action
  @prototype = Prototype.find(params[:id])
 end
end
