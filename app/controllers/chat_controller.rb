class ChatController < ApplicationController
  def show
    @messages = Chat.all
    # 記事ではMessageモデル
  end
end
