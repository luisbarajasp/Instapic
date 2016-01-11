class SearchController < ApplicationController
  def create
      word = "%#{params[:keyword]}%"

      @users = User.where("username LIKE ? OR name LIKE ?",word,word)
      @tags = SimpleHashtag::Hashtag.where("name LIKE ?",word)

      respond_to do |format|
          format.html { redirect_to :back }
          format.js 
      end

  end
end
