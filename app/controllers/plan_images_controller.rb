class PlanImagesController < ApplicationController
  before_filter :authenticate_user!
  
  def new
    @plan = Plan.find(params[:plan_id])
    @plan_image = PlanImage.new()

    respond_to do |format|
      format.html   {}  
      format.js  { 
        render  :action => 'new.js' 
      }
    end
    
  end
  

  def create
    @plan = Plan.find(params[:plan_id])
    @plan_image = PlanImage.new(params[:plan_image])
    @plan_image[:plan_id] = @plan[:id]

    respond_to do |format|
        format.html  {}
        format.js  {
          if @plan_image.save
            flash[:notice] = "Image uploaded".html_safe
            render :action => 'upload_success.js'
          else
            render :action => 'upload_error.js'
          end
        }
    end
  end
  
  def destroy
    @plan_image = PlanImage.find(params[:id])
    @plan = @plan_image.plan
    @plan_image.destroy

    redirect_to plan_url(@plan[:id]), :notice => 'Successfully deleted image'
  end


end
