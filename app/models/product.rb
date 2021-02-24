class Product < ActiveRecord::Base
  #The relationship is made to the category table, considering the rails standard that indicates
  #that the tables must be in the plural, with this form, it is allowed to indicate that you are working with the table provided.
  self.table_name = "product"
end
