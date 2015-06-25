
get '/timeframes/add' do
  erb :"timeframes/add_timeframe_form"
end

get '/timeframes/save' do
  
  # frame = TimeFrame.find(params["id"].to_i)
  # new_range = params["range"]
  # frame.range = new_range
  # frame.save
  new_range = TimeFrame.new(params["range"])
  new_range.save
 
  @new_timeframe = true  
  #update the database then send them to
  erb :"timeframes/add_timeframe_form"
  #so it acts like just reloaded page
end

#{ database last insert row id  -> to see if can bold last thing added.}

