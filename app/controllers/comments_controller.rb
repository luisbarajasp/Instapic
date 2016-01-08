class CommentsController < ApplicationController
    before_action :set_pic

    def create
        @comment = @picture.comments.build(comment_params)
        @comment.user_id = current_user.id

        if @comment.save
            respond_to do |format|
                format.html { redirect_to :back, notice: "Commented succesfully." }
                format.js
              end
        else
            redirect_to :back, alert: "Error: try again."
        end
    end

    def destroy
      @comment = @picture.comments.find(params[:id])

        if @comment.user_id == current_user.id
          @comment.delete
          respond_to do |format|
            format.html { redirect_to :back, notice: "Comment deleted succesfully." }
            format.js
          end
        end

    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end

    def set_pic
        @picture = Picture.find(params[:picture_id])
    end
end
