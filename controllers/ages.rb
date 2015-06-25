get '/age/edit' do
  erb :"ages/add_age_range_form"
end

get '/age/save' do
  

  Age.add(params)

 
  @new_range = true  
  #update the database then send them to
  erb :"ages/add_age_range_form"
  #so it acts like just reloaded page
end

#{ database last insert row id  -> to see if can bold last thing added.}

