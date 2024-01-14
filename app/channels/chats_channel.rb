# frozen_string_literal: true

class ChatsChannel < ApplicationCable::Channel
  def follow
    stream_from "chat_#{params[:chat_id]}" if params[:chat_id].present?
  end
end