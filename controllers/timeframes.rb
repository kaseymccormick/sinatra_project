
get '/timeframes/add' do
  erb :"/available_times/set_day_time_form"
end

get '/timeframes/save' do

  TimeFrame.create(params)

 
  @new_timeframe = true  
  #update the database then send them to
  erb :"/available_times/set_day_time_form"
  #so it acts like just reloaded page
end

#{ database last insert row id  -> to see if can bold last thing added.}

get "/timeframes/delete" do

  Timeframe.delete(params["id"])  
  #update the database then send them to
  erb :"/available_times/set_day_time_form"
  #so it acts like just reloaded page
end

get "/setup_poll" do
  erb :"/available_times/set_day_time_form"
  
end
