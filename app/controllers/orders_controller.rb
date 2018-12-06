class OrdersController < ApplicationController

  def create
    # Order.create!(buyer_id: current_user.id, delivery_method: params_order[:delivery_method])
    Order.create!(buyer_id: current_user.id, 
                  delivery_method: params_order[:delivery_method],
                  delivery_entity: params_order[:delivery_entity],
                  delivery_street: params_order[:delivery_street],
                  delivery_street2: params_order[:delivery_street2],
                  delivery_postcode: params_order[:delivery_postcode],
                  delivery_city: params_order[:delivery_city],
                  delivery_country: params_order[:delivery_country],
                  delivery_instructions: params_order[:delivery_instructions],
                  invoice_entity: params_order[:invoice_entity],
                  invoice_street2: params_order[:invoice_street2],
                  invoice_street: params_order[:invoice_street],
                  invoice_postcode: params_order[:invoice_postcode],
                  invoice_city: params_order[:invoice_city],
                  invoice_country: params_order[:invoice_country]
    )

    flash[:notice] = "Votre commande est bien passé"
    redirect_to root_path
  end

  def show
    
  end

  private 

  def params_order
    params.require(:order).permit(:delivery_method, 
                                  :delivery_entity, 
                                  :delivery_street, 
                                  :delivery_street2, 
                                  :delivery_postcode, 
                                  :delivery_city, 
                                  :delivery_country, 
                                  :delivery_instructions, 
                                  :invoice_entity, 
                                  :invoice_street, 
                                  :invoice_street2, 
                                  :invoice_postcode, 
                                  :invoice_city, 
                                  :invoice_country)
  end
end
