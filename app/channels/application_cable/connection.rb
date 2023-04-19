module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :websocket_token

    def connect
      ws_token = SecureRandom.base58 64
      self.websocket_token = ws_token
    end
  end
end
