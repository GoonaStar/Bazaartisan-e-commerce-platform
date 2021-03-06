class UsersController < ApplicationController

  include UsersHelper

  before_action :set_user, except: [:new]
  before_action :user_sales, except: [:update, :edit, :orders, :new]
  before_action :user_orders, except: [:update, :edit, :sales, :new]
  before_action :siret_search, only: [:new]


  def edit
    unless user_checked
      redirect_to public_profile_path(params[:id])
      flash[:error] = "You have no rights to access to this page"
    end
  end

  def update
  	@user.update(user_params)
  	redirect_back fallback_location: user_path(@user.id)
  end

  def show
    unless user_checked
      redirect_to public_profile_path(params[:id])
      flash[:error] = "You have no rights to access to this page"
    end
  end

  def new
    if user_signed_in?
      flash[:error] = "You have to be logged in to have access to this page"
      redirect_to user_path(current_user.id)
    end
  end

  def sales
    unless user_checked
      redirect_to public_profile_path(params[:id])
      flash[:error] = "You have no rights to access to this page"
    end
  end

  def orders
    unless user_checked
      redirect_to public_profile_path(params[:id])
      flash[:error] = "You have no rights to access to this page"
    end
  end

  def public_profile
    @user_sales = @user_sales.where(status: "sold").paginate(page: params[:page], per_page: 5)
    @user_adverts = Item.where(seller_id: @user.id, status: "published").paginate(page: params[:page], per_page: 5) 
   
    @user_orders = @user_orders.paginate(page: params[:page], per_page: 5)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  #extract of all params before updating user
  def user_params
  	params[:user].permit(:email, :first_name, :last_name, :phone_number, :personal_description, :activity, :company_name, :company_ID_number, :company_description, :invoice_entity, :invoice_street, :invoice_street2, :invoice_postcode, :invoice_city, :invoice_country, :delivery_entity, :delivery_street, :delivery_street2, :delivery_postcode, :delivery_city, :delivery_country, :delivery_instructions)
  end

  #sort of all items by status to display on profile page
  def user_sales
    @item_status = {
      'draft' => 'Drafts',
      'published' => 'Published',
      'sold' => 'Products sold'
    }

    @user_sales = @user.items.order('created_at DESC')

  end

  #sort of all orders by status to display on profile page
  def user_orders
    @order_status = {
      'paid' => 'Products payed',
      'being_shipped' => 'In delivery',
      'shipped' => 'Objects received'
    }

    @user_orders = @user.orders.order('created_at DESC')
  end

  def siret_search

    #launch search if parameter is detected
    if params['siren']
      @request = params['siren']['request']
      @siret_result = Sirene.new(@request).perform
      puts @error 
    end

  end

end