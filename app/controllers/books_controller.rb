class BooksController < ApplicationController
  def index
   @user =current_user
   @book =Book.new
   @books =Book.page(params[:page]).reverse_order
  end

  def create
   @book =Book.new(book_params)
   @book.user_id = current_user.id
   if@book.save
   redirect_to book_path(@book),notice: 'Book was successfully created.'
   else
    @user =current_user
    @books =Book.page(params[:page]).reverse_order
    render :index
   end
  end

  def show
    @user =current_user
    @book =Book.find(params[:id])
  end

  def edit
   @book =Book.find(params[:id])
  unless @book.user == current_user
    redirect_to books_path
  end
  end

  def update
   @book = Book.find(params[:id])
   if@book.update(book_params)
     redirect_to book_path(@book),notice: 'You have updated book successfully.'
   else
    render :edit
   end
  end

  def destroy
   @book = Book.find(params[:id])
   @book.destroy
   redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
