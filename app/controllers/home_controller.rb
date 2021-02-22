class HomeController < ApplicationController
    # index para este caso, es el que muestra el home del ecommerce.
    def index
      @search = params[:search]
      @categories = Category.order(name: :asc)

      @current_category = Category.find_by_id(params[:category_id])
      if @current_category.blank?
        @current_category = @categories.first
      end

      if @search.blank?
        @products = Product.where(category: @current_category.id).order(name: :asc)         
      else
        @products = Product.joins("INNER JOIN category ON product.category = category.id").where("product.name like ? OR category.name like ?", "%#{@search}%", "%#{@search}%").order(name: :asc)
      end
    
    end
end
