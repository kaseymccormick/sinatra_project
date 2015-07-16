get '/days/edit' do
  erb :"/available_times/set_day_time_form"
end

get '/days/save' do
  Day.add(params) 
  @new_day = true
  erb :"/available_times/set_day_time_form"
end
get '/days/delete' do
  Day.delete(params["id"])  
  #update the database then send them to
  erb :"/available_times/set_day_time_form"
  #so it acts like just reloaded page
end


#{ database last insert row id  -> to see if can bold last thing added.}

