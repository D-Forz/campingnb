class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[show destroy]

  def add_index
    @bookmarks = Bookmark.all
  end

  def show; end

  def create
    @bookmark = Bookmark.new(params[:id])
    # @bookmark.user_id = current_user.id
    if @bookmark.save
      redirect_to bookmark_path(@bookmark)
    else
      render 'bookmark/show', status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy
    redirect_to bookmark_path(@bookmark)
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
end
