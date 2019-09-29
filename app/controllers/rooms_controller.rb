class RoomsController < ApplicationController

  # Deviseのログイン確認
  before_action :authenticate_user!

  # Room一覧アクション
  def index
    @rooms = Room.all.order(:id)
  end

  def show
    @room = Room.find(params[:id])
    # メッセージ一覧を取得
    @messages = @room.messages
  end

  def new
    @room = Room.new
  end

  def create
    puts
    @room = Room.new(name: params[:room][:name])

    if @room.save
      redirect_to root_path, notice: "新たな部屋を作成しました"
    else
      render rooms_new_path
    end
  end

  def edit
    @room = Room.find_by(id: params[:id])
  end

  def update
    @room = Room.find_by(id: params[:id])
    @room.assign_attributes(name: params[:name])
    if @room.save
      redirect_to root_path, notice: "部屋名を変更しました"
    else
      render rooms_edit_path
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to root_path, notice: "部屋を削除しました"
  end

end