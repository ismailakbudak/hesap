require 'application_responder'

class User::ApplicationController < ActionController::Base
  before_action :authenticate_user!
  self.responder = ApplicationResponder
  respond_to :html, :json
end