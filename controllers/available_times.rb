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
      Days_Responders_Timeframes.create({"responders_id" => params["responders_id"], "timeframes_id" => time, "days_id" => day})
    end
  end
  
  @added = true
  erb :"available_times/availability_table"
end

get "/responders/availability" do
  @complete_list = true
  erb :"available_times/availability_table"
end

get "/user_availability/best" do
  @date = AvailableTime.most_days
  @frame = AvailableTime.most_timeframes(@date)
  binding.pry
  @users = AvailableTime.list_responders(@frame, @date)
  erb :"available_times/best_availability"
end 

get '/responder/delete_availability' do
  @user_id = params["responders_id"].to_i  
  AvailableTime.delete_all(@user_id)
  erb :"/available_times/new_availability_form"
end


