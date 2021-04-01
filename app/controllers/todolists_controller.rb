class TodolistsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    # データを新規投稿する
    list = List.new(list_params)
    #　データベースを保存するsaveメソッドを実行
    list.save
    #　トップ画面へリダイレクト
    redirect_to todolist_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to todolist_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to todolists_path
  end

  private
  #　ストロングパラミーター
  def list_params
  params.require(:list).permit(:title, :body, :image)
  end

end
