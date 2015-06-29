
get "/responder/add" do
  erb :"responders/add_responder_form"
end

get "/responder/save" do

  if @user = Responder.add({"name"=> params["name"], "e_mail" => params["e_mail"], "age_id" => params["age_id"].to_i})    

    @new = true
    erb :"available_times/select_availability_form"
    
  else
    @user = Responder.get_e_mail(params["e_mail"]).first 
    @user_availability = AvailableTime.find_all_of(@user.id)
    erb :"available_times/edit_availability_form"
  end
  
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




