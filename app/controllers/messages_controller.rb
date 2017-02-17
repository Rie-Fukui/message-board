class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
  def index
    @message = Message.new
    @messages = Message.all
  end
  
  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path, notice: 'メッセージを投稿しました'
    else
      @messages = Message.all
      render 'index'
    end
  end

  def edit
  end
  
  def update
    if @message.update(message_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end

  def destroy
    @message.destroy
    redirect_to root_path
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end
  
  def message_params
    params.require(:message).permit(:name, :body)
  end
end
