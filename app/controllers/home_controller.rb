# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    render file: Rails.root.join('public', 'index.html.erb')
  end
end
