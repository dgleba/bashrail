class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  #cancancan
  load_and_authorize_resource

  # GET /products
  def index
    # @products = Product.all
    @q = Product.search(params[:q]) 
    @products = @q.result.page(params[:page])
  end

  # GET /products/1
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    # http://www.justinweiss.com/articles/respond-to-without-all-the-pain/
    flash[:notice] = "Successfully created.." if @product.save
    respond_with(@product)

    # From rails 4.2, it was originally:
    # if @product.save
      # redirect_to @product, notice: 'Product was successfully created.'
    # else
      # render :new
    # end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      respond_with(@product)
      # was..
      # redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
      # ? not sure what to do here... respond_with(@product)
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :pdate, :active_status, :sort)
    end
end
