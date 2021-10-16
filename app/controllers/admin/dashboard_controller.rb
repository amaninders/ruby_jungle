class Admin::DashboardController < ApplicationController
  def show
    @products = Product.order(id: :desc).all
		@categories = Category.order(id: :desc).all
		@orders = Order.order(id: :desc).all
  end
end
