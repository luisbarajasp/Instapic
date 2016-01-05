class PicturesController < ApplicationController

  before_filter :check_user, only: [:edit, :update, :destroy]

  def index
      @pictures = Picture.all.order('created_at DESC')
  end

  def new
      @picture = Picture.new
  end

  def create
      @picture = Picture.new picture_params
      @picture.user_id = current_user.id

      if @picture.save
          redirect_to @picture, notice: "Picture uploaded succesfully."
      else
          render 'new', alert: "Error: try again."
      end
  end

  def show
      @picture = Picture.find(params[:id])
      @comment = Comment.new comment_params
      @comments = @picture.comments.order('created_at DESC')
  end

  def edit
      @picture = Picture.find(params[:id])
  end

  def update
      @picture = Picture.find(params[:id])

      respond_to do |f|
			if @picture.update(picture_params)
				f.html {redirect_to @picture, notice: "Picture updated succesfully."}
				f.json { render :show, status: :ok, location: @picture }
			else
				f.html { render :edit }
				f.json { render json: @picture.errors, status: :unprocessable_entity }
			end
		end
  end

  def destroy
      @picture = Picture.find(params[:id])
      @picture.destroy

      redirect_to pictures
  end

  private

  def picture_params
      params.require(:picture).permit(:description,:image,:user_id)
  end

  def comment_params
      params.require(:comment).permit(:content)
  end

  def check_user
    	if current_user != @pin.user
    		redirect_to root, alert: "This picture is not yours"
    	end
  end
end
