class PlansController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html, :js

  can_edit_on_the_spot
  
  # GET /plans
  def index
    @order = ["created_at desc", "name asc"]
    @page_number = params[:page].nil? ? 1 : params[:page].to_i
    @total_pages  = 0
    if params[:id].nil?
      @plans = Plan.all_plans_for(current_user).order(@order).paginate(:page => @page_number, :per_page => Plan.per_page)
    else
      plan_type = PlanType.find(params[:id].to_i)
      plan_class_name = "#{plan_type[:name].capitalize}Plan"
      @plans = plan_class_name.constantize.all_plans_for(current_user).order(@order).paginate(:page => @page_number, :per_page => Plan.per_page)
    end
    @total_pages = @plans.count / Plan.per_page + (@plans.count % Plan.per_page > 0 ? 1 : 0 ) if @plans.count > 0    
    @plan_type = plan_type.nil? ? 0 : plan_type[:id]
  end

  # GET /plans/1
  def show
    @plan = Plan.find(params[:id])
    authorize! :read, @plan
  end
  
  # GET /plans/new
  def new
    @plan_type_id =  params[:id].nil? ? 1 : params[:id].to_i
    @plan = Plan.new(:plan_type_id => @plan_type_id)

    respond_to do |format|
        format.html     
        format.js  {
          # render  :action => 'new.js'
        }
    end
    
  end

  # POST /plans
  def create
    plan_type = PlanType.find(params[:plan][:plan_type_id].to_i)
    plan_class_name = "#{plan_type[:name].capitalize}Plan"
    @plan = plan_class_name.constantize.new(params[:plan])
    @plan[:creator_id] = current_user.id

    respond_to do |format|
        format.html  {}
        format.js  {
          if @plan.save
            flash[:notice] = "Created plan - #{undo_link}".html_safe
            render :action => 'create_plan_success.js'
          else
            render :action => 'create_plan_error.js'
          end
        }
    end
  end

 # POST /plans/1/edit.js 
  def edit
    @plan = Plan.find(params[:id])
    respond_to do |format|
        format.html     
        format.js  {
          # render  :action => 'edit.js'
        }
    end
  end
 
  # PUT /plans/1
  def update
    @plan = Plan.find(params[:id])

    if @plan.update_attributes(params[:plan])
      redirect_to(@plan, :notice => 'Plan was successfully updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /plans/1
  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    redirect_to plans_url, :notice => "Deleted plan #{undo_link}".html_safe
  end

  private

  def undo_link
    view_context.link_to("undo", revert_version_path(@plan.versions.scoped.last), :method => :post)
  end

end