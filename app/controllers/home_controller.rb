# HomeController is the controller that manages everything about the home of the ecommerce
class HomeController < ApplicationController

    # index for this case, is the one that shows the *home* of the ecommerce.
    # A method is created to handle product searches.
    def index
      # @search will be equal to the search parameter specified by the user in the home nav.
      @search = params[:search]

      # @categories is a global variable that saves the query to the category table, it brings all the records from the table
      # sorted by name in ascending order.
      @categories = Category.order(name: :asc)

      # @current_category will return a single record from the category table, and if the attribute value does not exist in the database,
      # will return null.
      @current_category = Category.find_by_id(params[:category_id])

      # conditional to indicate if current_category is empty, fetch the first category of the product.
      if @current_category.blank?
        @current_category = @categories.first
      end

      # Conditional to indicate if the search is empty.
      if @search.blank?
        # In this case, @products will bring all the products of the current_category sorted by name in ascending order.
        @products = Product.where(category: @current_category.id).order(name: :asc)
      else
        # In this case, @products will bring up all the products of the search by name and / or category ordered by name in ascending order.
        @products = Product.joins("INNER JOIN category ON product.category = category.id").where("product.name like ? OR category.name like ?", "%#{@search}%", "%#{@search}%").order(name: :asc)
      end
    
    end
end
