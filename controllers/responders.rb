
get "/responder/add" do
  erb :"responders/add_responder_form"
end

get "/responder/save" do

  if @user = Responder.create({"name"=> params["name"], "e_mail" => params["e_mail"], "password" => params["password"], "zipcode" => params["zipcode"], "user_weight" => params["user_weight"]})    
    @new = true
    
    if (Day.all.empty? && TimeFrame.all.empty?)# (see if days and times tables are empty)
      erb :"/available_times/set_day_time_form" 
    else
      erb :"available_times/select_availability_form"
    end
  else
    @user = Responder.get_e_mail(params["e_mail"]).first 
    @user_availability = AvailableTime.find_all_of(@user.id)
    erb :"available_times/edit_availability_form"
  end
  
end

get "/setavailability" do
  erb :"/available_times/set_day_time_form" 
end


get "/responder/list" do
  erb :"responders/responder_saved"
end

get "/responder/e_mail_save" do

  user = Responder.find(params["id"].to_i)
  new_email = params["e_mail"]
  user.e_mail = new_email
  user.save

  @responder_edit = true  
  erb :"responders/responder_saved"

end

get "/user/login" do
  erb :"responders/login_form"
end

get "/responder/login" do
  if  Responder.log_in_user(params["e_mail"], params["password"])
    erb :"available_times/edit_availability_form"
  else
    @error = true
    erb :"responder/login_form"
  end
end

get '/user_availability/responders/availability' do
  erb :"available_times/availability_table"
end


