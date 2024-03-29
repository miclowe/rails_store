class ReviewsController < ApplicationController

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:id])
    @product = Product.find{|p| p.id == params[:id].to_i}

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review = Review.new

    @product = Product.find{|p| p.id == params[:id].to_i}

    if params[:id].present?
      @product_name = Product.all.find{|p| p.id == params[:id].to_i}.name
    else 
      # @product_name = Product.find{|p| p.id == (@review.product_id).to_i}.name
      @product_name = Product.all.find{|p| p.id == (@review.product_id).to_i}
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
    @product = Product.find{|p| p.id == params[:id].to_i}

    if params[:id].present?
      @product_name = Product.all.find{|p| p.id == params[:id].to_i}.name
    else 
      # @product_name = Product.find{|p| p.id == (@review.product_id).to_i}.name
      @product_name = Product.all.find{|p| p.id == (@review.product_id).to_i}
    end
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(params[:review])
    @product = Product.find{|p| p.id == (@review.product_id).to_i}

    respond_to do |format|
      if @review.save
        format.html { redirect_to @product, notice: 'Review was successfully created.' }
        format.json { render json: @product, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end
end
