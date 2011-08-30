module UserProfilesHelper
  
  def bottom_user_profile_bar_gym_display(user_profile)
    return user_profile[:gym].blank? ? 'none' : 'visible'
  end

  def bottom_user_profile_bar_sports_display(user_profile)
    return user_profile[:sports].blank? ? 'none' : 'visible'
  end

  def bottom_user_profile_bar_brands_display(user_profile)
    return user_profile[:brands].blank? ? 'none' : 'visible'
  end
  
  def who_i_am_display(user_profile, user_type )
    return user_profile.user_types.map{|ut| ut[:id]}.include?(user_type[:id]) ? 'visible' : 'none'
  end

  def what_i_want_display(user_profile, user_want )
    return user_profile.user_wants.map{|uw| uw[:id]}.include?(user_want[:id]) ? 'visible' : 'none'
  end
  
  def user_profile_summary_display(user_profile ) 				
    return user_profile[:summary].blank? ? 'none' : 'visible'
	end
	
	def user_profile_city_display(user_profile)
	  return user_profile[:city].blank? ? 'none' : 'visible'
	end

	def user_profile_country_display(user_profile)
	  return @user_profile[:country].blank? ? 'none' : 'visible'
	end
	
	def user_profile_age_display(user_profile)
	  return @user_profile[:dob].blank? ? 'none' : 'visible'
  end
    
end
