get '/days/edit' do
  erb :"days/add_days_form"
end

get '/days/save' do
  
  # frame = TimeFrame.find(params["id"].to_i)
  # new_range = params["range"]
  # frame.range = new_range
  # frame.save
  Day.add(params)

 
  @new_day = true  
  #update the database then send them to
  erb :"days/add_days_form"
  #so it acts like just reloaded page
end

#{ database last insert row id  -> to see if can bold last thing added.}

