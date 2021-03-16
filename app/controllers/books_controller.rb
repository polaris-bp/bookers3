class BooksController < ApplicationController
  # @book周り綺麗にしたい?
  def index
    @user = current_user
    @books = Book.all
    @new_book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(@book.user_id)
    @new_book = Book.new
  end

  # def new
  #   @book = Book.new
  # end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    @user = current_user

    if @new_book.save
      redirect_to book_path(@new_book), notice: "Book was successfully created."
    else
      @books = Book.all
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    user = User.find(@book.user_id)
    if user != current_user
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to book_path, notice: "Book was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
