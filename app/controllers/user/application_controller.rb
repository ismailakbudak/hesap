require 'application_responder'

class User::ApplicationController < ActionController::Base
  layout 'application'
  before_action :authenticate_user!
  self.responder = ApplicationResponder
  respond_to :html, :json
end