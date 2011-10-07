module DaysHelper
  
  def toggleShowLink_label(day)
    day[:show_flag] ? 'Hide completed' : 'Show completed'
  end
  
end
