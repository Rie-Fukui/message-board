class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update]
  
  # 中略

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

  # 中略

  private

  # 中略

  def set_message
    @message = Message.find(params[:id])
  end
end
