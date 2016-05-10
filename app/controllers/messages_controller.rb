class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @body = "Hello, this is " + current_user.name + ". I'm intersted in talking soon."
  end

  def create
    recipients = User.where(id: params['recipients'])
    conversation = current_user.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversations_path
  end
end
