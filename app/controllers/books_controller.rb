class BooksController < ApplicationController

  before_action :set_book, :only => [:show, :edit, :update, :destroy]

  def index
    @books = Book.page(params[:page]).per(5)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save

    if @book.save
      flash[:notice] = "新增成功！"
      redirect_to books_url
    else
      render 'new'
    end


  end

  def show
  end

  def edit
  end

  def update
    @book.update(book_params)

    if @book.update(book_params)
      flash[:notice] = "修改成功！"
      redirect_to book_url(@book)
    else
      render 'edit'
    end


  end

  def destroy
    @book.destroy
    flash[:alert] = "刪除成功！"
    redirect_to books_url
  end

  private

  def book_params
    params.require(:book).permit(:name, :description, :isbn)
  end

  def set_book
    @book = Book.find(params[:id])
  end

end
