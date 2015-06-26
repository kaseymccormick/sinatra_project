get "/user_availability/save" do
  binding.pry
  AvailableTime.send_availability(params)
  #need to AvailableTime.send_availability(params["responder_id"], value_x, value_y)
  binding.pry
  erb :"responders/availability_table" 
end

get "/responders/availability" do
  erb :"responders/availability_table"
end

#get "/user_availability/best" do
  # all users with the x date x time slot like songs
#end

get "/user_availability/best" do
  @date = AvailableTime.most_days
  @frame = AvailableTime.most_timeframes
  @users = AvailableTime.list_responders(@frame, @date)
  binding.pry
  erb :"responders/list_same"
end 



