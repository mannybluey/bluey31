module MealsHelper
  
  def options_for_meal_name(day)
    day_meal_names = day.meals.map {|meals| meals[:name] unless meals[:name] == 'snack'}.uniq
    meal_names = ['breakfast', 'lunch', 'dinner'] - day_meal_names
    return meal_names << 'snack'
  end
  
end
