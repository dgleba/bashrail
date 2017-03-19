<% if namespaced? -%>
require_dependency "<%= namespaced_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  #cancancan
  load_and_authorize_resource

  # GET <%= route_url %>
  def index
    # @<%= plural_table_name %> = <%= orm_class.all(class_name) %>
    @q = <%= class_name %>.search(params[:q]) 
    @<%= plural_table_name %> = @q.result.page(params[:page])
  end

  # GET <%= route_url %>/1
  def show
  end

  # GET <%= route_url %>/new
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
  end

  # GET <%= route_url %>/1/edit
  def edit
  end

  # POST <%= route_url %>
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
    # http://www.justinweiss.com/articles/respond-to-without-all-the-pain/
    #flash[:notice] = "Successfully created.." if @<%= orm_instance.save %>
    respond_with(@<%= singular_table_name %>)

    # From rails 4.2, it was originally:
    # if @<%= orm_instance.save %>
      # redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully created.'" %>
    # else
      # render :new
    # end
  end

  
  
  # PATCH/PUT <%= route_url %>/1
  # def update
    # if @<%= orm_instance.update("#{singular_table_name}_params") %>
      # respond_with(@<%= singular_table_name %>)
      # # was..
      # # redirect_to @<%= singular_table_name %>, notice: <%= "'#{human_name} was successfully updated.'" %>
    # else
      # render :edit
      # # ? not sure what to do here... respond_with(@<%= singular_table_name %>)
    # end
  # end

  # from rail263...
  # PATCH/PUT <%= route_url %>/1
  def update
    respond_to do |format|
      if @<%= orm_instance.update("#{singular_table_name}_params") %>
        format.html { redirect_to @<%= singular_table_name %>, notice: t('success_update') }
        format.json { render :show, status: :ok, location: @<%= singular_table_name %> }
      else
        format.html { render :edit }
        format.json { render json: @<%= singular_table_name %>.errors, status: :unprocessable_entity }
      end
    end
  end

  
  # DELETE <%= route_url %>/1
  def destroy
    @<%= orm_instance.destroy %>
    redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} was successfully destroyed.'" %>
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[:<%= singular_table_name %>]
      <%- else -%>
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end
end
<% end -%>
