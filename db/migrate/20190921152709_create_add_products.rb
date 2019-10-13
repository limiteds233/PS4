class CreateAddProducts < ActiveRecord::Migration[6.0]
  def change
	  	 Product.create ({
	  	   :title => 'Gav',
	  	   :discription => 'This is Gawaiian pizza',
	  	   :price => 500, :size => 30, 
	  	   :is_spicy => false, 
	  	   :is_veg => false, 
	  	   :is_best_offer => false, 
	  	   :path_to_image => '/images/gav.jpg'
	  	})

	  	 Product.create ({
	  	 	:title => 'Marg', 
	  	 	:discription => 'This is Margarita pizza',
	  	 	:price => 400, 
	  	 	:size => 30,
	  	 	:is_spicy => false, 
	  	 	:is_veg => false, 
	  	 	:is_best_offer => false,
	  	 	:path_to_image => '/images/marg.jpg'
	  	 })

	  	 Product.create ({
	  	     :title => 'Pep',
	  	     :discription => 'This is Pepperoni pizza',
	  	     :price => 600,
	  	     :size => 30,
	  	     :is_spicy => false,
	  	     :is_veg => false,
	  	     :is_best_offer => false,
	  	     :path_to_image => '/images/pep.jpg'
	  	 })
     			
 	end

end
