get "/user_availability/save" do
  binding.pry
  CONNECTION.execute("INSERT INTO available_times (responders_id, timeframes_id, days_id) VALUES ('#{params["responders_id"]}', #{params["slots"]["dates"][0]}, #{params["slots"]["dates"][1]["frames"][0]});")
  binding.pry
  erb :"responders/availability_table" 
end

#get "/user_availability/best" do
  # all users with the x date x time slot like songs
#end

get "/user_availability/best" do
  binding.pry
  AvailableTime.most_days
  binding.pry
  "who the hell knows"
  #erb :"responders/list_same"
end



