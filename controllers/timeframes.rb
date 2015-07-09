
get '/timeframes/add' do
  erb :"timeframes/add_timeframe_form"
end

get '/timeframes/save' do

  TimeFrame.add(params)

 
  @new_timeframe = true  
  #update the database then send them to
  erb :"timeframes/add_timeframe_form"
  #so it acts like just reloaded page
end

#{ database last insert row id  -> to see if can bold last thing added.}

get "/timeframes/delete" do

  Age.delete(params["id"])  
  #update the database then send them to
  erb :"ages/add_timeframe_form"
  #so it acts like just reloaded page
end