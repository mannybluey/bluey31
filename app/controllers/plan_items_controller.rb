class PlanItemsController < ApplicationController
  
  respond_to :html, :js

  def new
    @plan = Plan.find(params[:plan_id])
    @selection = @plan.plan_type[:name].downcase
    @day = Day.find(params[:day_id])
    @plan_item = PlanItem.new
    @plan_item.plan_item_sets.build
  end

  def create
    @plan_item = PlanItem.new(params[:plan_item])
    @plan_item.day_id = params[:day_id]
    respond_to do |format|
      if @plan_item.save
        format.js
      else
        format.js
      end
    end
  end

  def edit
    @plan_item = PlanItem.find(params[:id])
    @selection = @plan_item.day.plan.plan_type[:name].downcase
    @plan = Plan.find(params[:plan_id])
    @day = Day.find(params[:day_id])
  end

  # PUT /update/:id
  def update
    @plan_item = PlanItem.find(params[:id])
    @selection = @plan_item.day.plan.plan_type[:name].downcase
    respond_to do |format|
      if @plan_item.update_attributes(params[:plan_item])
        format.js
      else
        format.js
      end
    end
  end

  def destroy
    @plan_item = PlanItem.find(params[:id])
    @selection = @plan_item.day.plan.plan_type[:name].downcase
    @plan_item.destroy
    redirect_to :back, :notice => "Deleted exercise #{undo_link}".html_safe
  end

  private

  def undo_link
    view_context.link_to("undo", revert_version_path(@plan_item.versions.scoped.last), :method => :post)
  end
end
