class PlansController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html, :js

  can_edit_on_the_spot
  
  # GET /plans
  def index
    @selection = params[:selection]
    @order = ["created_at desc", "name asc"]
    if params[:selection].nil?
      @plans = Plan.all_for(current_user).order(@order).page(params[:page])
    else
      case @selection
      when 'exercise'
        @plans = Plan.exercises_for(current_user).order(@order).page(params[:page])
      when 'nutrition'
        @plans = Plan.nutritions_for(current_user).order(@order).page(params[:page])
      end
    end
  end

  # GET /plans/exercises
  def exercises
    redirect_to plans_url(:selection => :exercise)
  end
  
  # GET /plans/nutritions
  def nutritions
    redirect_to plans_url(:selection => :nutrition)
  end
    
  # GET /plans/1
  def show
    @plan = Plan.find(params[:id])
    @selection = @plan.plan_type[:name].downcase
    authorize! :read, @plan
  end
  
  # GET /plans/new
  def new
    @plan = Plan.new(:plan_type_id => @plan_type_id)
  end

  # POST /plans
  def create
    @plan = Plan.new(params[:plan])
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
    @selection = @plan.plan_type[:name].downcase
  end
 
  # PUT /plans/1
  def update
    @plan = Plan.find(params[:id])
    unless params[:plan_item].nil? || params[:plan_item][:id].nil?
      plan_item = PlanItem.find(params[:plan_item][:id])
      case params[:plan_item][:completed] 
        when "true" then plan_item.perform!
        when "false" then plan_item.reset!
      end
    end
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
