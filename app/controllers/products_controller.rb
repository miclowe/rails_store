class ProductsController < ApplicationController
  # GET /products
  # GET /products.json

  before_filter :set_cart#, :only => [:edit, :show]

  def set_cart
    @products_in_cart = Product.where(:in_cart => true)
  end

  def index
    @products = Product.all

      respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def update_cart
    @product = Product.find(params[:id])
    
    if @product[:in_cart]
      @product[:in_cart] = ""
    else
      @product[:in_cart] = "t"
    end

    respond_to do |format|
      @product.update_attributes(params[:product])
      format.html { redirect_to products_url, notice: 'Your cart has been updated.' }
      format.json { head :no_content }

    end
  end

  # def add_to_cart
  #   @product = Product.find(params[:id])
    
  #   @product[:in_cart] = "t"

  #   respond_to do |format|
  #     @product.update_attributes(params[:product])
  #     format.html { redirect_to products_url, notice: 'Product was successfully added to cart.' }
  #     format.json { head :no_content }

  #   end
  # end

  # def remove_from_cart
  #   @product = Product.find(params[:id])
    
  #   @product[:in_cart] = false

  #   respond_to do |format|
  #     @product.update_attributes(params[:product])
  #     format.html { redirect_to products_url, notice: 'Product was successfully removed from cart.' }
  #     format.json { head :no_content }

  #   end
  # end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    # @user_reviews = Review.where(:product_id => params[:id])
    @user_reviews = Review.where(:product_id => @product.id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
