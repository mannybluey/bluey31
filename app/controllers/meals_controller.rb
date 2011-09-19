class MealsController < ApplicationController

  respond_to :html, :js
  
  def new
    @plan = Plan.find(params[:plan_id])
    @selection = @plan.plan_type[:name].downcase
    @day = Day.find(params[:day_id])
    @meal = Meal.new
    @meal.aliments.build
  end

  def create
    @meal = Meal.new(params[:meal])
    @meal.day_id = params[:day_id]
    respond_to do |format|
      if @meal.save
        format.js
      else
        format.js
      end
    end
  end

  def edit
    @meal = Meal.find(params[:id])
    @plan = Plan.find(params[:plan_id])
    @day = Day.find(params[:day_id])
    render :action => 'edit.js'
  end

  # PUT /update/:id
  def update
    @meal = Meal.find(params[:id])
    respond_to do |format|
      if @meal.update_attributes(params[:meal])
        format.js
      else
        format.js
      end
    end
  end

  def destroy
    @meal = Meal.find(params[:id])
    @meal.destroy
    redirect_to :back, :notice => "Deleted meal #{undo_link}".html_safe
  end

  private

  def undo_link
    view_context.link_to("undo", revert_version_path(@meal.versions.scoped.last), :method => :post)
  end
end
