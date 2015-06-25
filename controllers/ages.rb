get '/age/edit' do
  erb :"ages/add_age_range_form"
end

get '/age/save' do
  
  # frame = TimeFrame.find(params["id"].to_i)
  # new_range = params["range"]
  # frame.range = new_range
  # frame.save
  Age.add(params)

 
  @new_group = true  
  #update the database then send them to
  erb :"days/add_age_range_form"
  #so it acts like just reloaded page
end

#{ database last insert row id  -> to see if can bold last thing added.}

