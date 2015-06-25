
get '/timeframes/add' do
  erb :"timeframes/add_timeframe_form"
end

get '/timeframes/save' do
  binding.pry
  frame = TimeFrame.find(params["id"].to_i)
  frame.range = params["range"]
  binding.pry
  frame.save

  @new_timeframe = true  
  #update the database then send them to
  erb :"timeframes/add_timeframe_form"
  #so it acts like just reloaded page
end

#{ database last insert row id  -> to see if can bold last thing added.}

