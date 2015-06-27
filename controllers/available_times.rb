get "/user_availability/save" do
  array_of_answers = params["slots"]["dates"]
  
  days = []
  times = []
  
  array_of_answers.each_with_index do |x, i|
    if i.even?
      days << x
    else  
      times << x["frames"]
    end  
  end  
  
  hash_of_answers = Hash[days.zip(times)]
  
  hash_of_answers.each do |day, times|
    times.each do |time|
      AvailableTime.send_availability(params["responders_id"], day, time)
    end
  end
  
  
  # slots = {}
  #
  # (0...array_of_answers.length).step(2).each do |index|
  #       #
    #
    # value_x = array_of_answers[index]
    # value_z = ((value_x.to_i) +1)
    #
    #
    # (0...params["slots"]["dates"][value_x.to_i+1]["frames"].length).step(2).each do |index|
    #   value_y = params["slots"]["dates"][(value_x.to_i+1)]["frames"][index]
    #     AvailableTime.send_availability(params, value_x, value_y)
    # end
  # end

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



