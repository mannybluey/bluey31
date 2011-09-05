class PlanItemImagesController < ApplicationController
  
  before_filter :authenticate_user!
  
  def new
    @plan_item = PlanItem.find(params[:plan_item_id])
    @plan = @plan_item.day.plan
    @plan_item_image = PlanItemImage.new()

    respond_to do |format|
      format.html   {}  
      format.js  { 
        render  :action => 'new.js' 
      }
    end
    
  end
  

  def create
    @plan_item = PlanItem.find(params[:plan_item_id])
    @plan = Plan.find(params[:plan_id])
    @plan_item_image = PlanItemImage.new(params[:plan_item_image])
    @plan_item_image[:plan_item_id] = @plan_item[:id]


    respond_to do |format|
        format.html  {}
        format.js  {
          if @plan_item_image.save
            flash[:notice] = "Image uploaded".html_safe
            render :action => 'upload_success.js'
          else
            render :action => 'upload_error.js'
          end
        }
    end
  end
  
  def destroy
    @plan_item_image = PlanItemImage.find(params[:id])
    @plan_item = @plan_item_image.plan_item
    @plan = @plan_item.day.plan
    @plan_item_image.destroy

    redirect_to plan_url(@plan[:id]), :notice => 'Successfully deleted image'
  end


end
