class BooksController < ApplicationController
  def index
    @profile_images=@user.proile_images
    @book =Book.new
    @books =Book.all
  end

  def create
   @book =Book.new(book_params)
   @book.user_id = current_user.id
   @book.save
    redirect_to books_path
  end

  def show
  　@user =User.find(params[:id])
  end

  def edit
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
