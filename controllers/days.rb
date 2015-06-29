get '/days/edit' do
  erb :"days/edit_days_form"
end

get '/days/save' do
  Day.add(params) 
  @new_day = true
  erb :"/days/edit_days_form"
end
get '/days/delete' do
  Day.delete(params["id"])  
  #update the database then send them to
  erb :"/days/edit_days_form"
  #so it acts like just reloaded page
end


#{ database last insert row id  -> to see if can bold last thing added.}

