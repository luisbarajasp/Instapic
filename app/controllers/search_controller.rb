class SearchController < ApplicationController
  def create
      word = "%#{params[:keyword]}%"

      @users = User.where("username LIKE ? OR name LIKE ?",word,word)
    #   @tags = SimpleHashtag::Hashtag.where("name LIKE ?",word)

      raise @users.to_yaml

  end
  def show
  end
end
