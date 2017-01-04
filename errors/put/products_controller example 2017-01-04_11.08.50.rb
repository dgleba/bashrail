class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  #cancancan
  load_and_authorize_resource

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
      respond_with(@product)
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
  # def update
    # if @product.update(product_params)
      # respond_with(@product)
      # # was..
      # # redirect_to @product, notice: 'Product was successfully updated.'
    # else
      # render :edit
      # # ? not sure what to do here... respond_with(@product)
    # end
  # end

  # from rail263...
  # PATCH/PUT /products/1
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: t('success_update') }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # # DELETE /products/1
  # def destroy
    # @product.destroy
    # respond_with(@product)
    # #redirect_to products_url, notice: 'Product was successfully destroyed.'
  # end

  # DELETE /products/1
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: t('success_destroy') }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :pdate, :active_status, :sort, :pfeature_ids=> [])
    end
end
