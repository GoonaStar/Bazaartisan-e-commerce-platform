class ItemsController < ApplicationController

  before_action :def_filters, only: [:index]
  before_action :set_item, except: [:new, :create, :index]

  def new
    if current_user
      @item = Item.new
    else
      redirect_to new_user_session_path
      flash[:error] = "Your have to be logged on to publish an ad"
    end
  end

  def create
    #creation of the new item
    new_item = Item.create!(item_params)

    #Update the status of the user to tell he is a seller
    new_item.seller.update(is_seller:true)

    redirect_to item_path(new_item.id), notice: "Great ! Your item is online"
  end

  def index
    # Filter items according to the form parameters
    @item_selection = Item.where(@filters).order('created_at DESC').paginate(page: params[:page], per_page: 18)
  end

  def show
  end

  def edit
    unless @item.seller == current_user
      flash[:error] = "You have no rights to edit this product"
      redirect_to item_path(params[:id])
    end

  end

  def update
    @item.update(item_params)
    redirect_to item_path(@item.id), notice: "Product modified"
  end

  def destroy
    @item.destroy
    redirect_to user_sales_path(current_user.id)
  end

  def duplicate
    new_item = Item.create(@item.attributes.except('id','status','order_id','cart_id','created_at','updated_at'))
    new_item.status = 'draft'
    new_item.save

    flash[:notice] = "Your ad has been sent to the draft. Take time to read it before publishing it"
    redirect_to edit_item_path(new_item.id)
  end

  def draft
    @item.status = 'draft'
    @item.save

    flash[:notice] = "Your ad has been sent to the draft"
    redirect_to user_sales_path(current_user.id)
  end
  
  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
      params.require(:item).permit(:title, :category_id, :description, :price, :seller_id, :status, item_images: [])
  end

  def status
    @status = ['draft', 'published', 'sold', 'deleted']
  end

  def def_filters
    begin
      @filters = params.require(:item_filter).permit(:category_id, :status, :seller_id)
      puts @filters
    rescue
      @filters = {status:'published'}
    end
  end

end