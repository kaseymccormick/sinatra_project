
get "/responder/add" do
  erb :"responders/add_responder_form"
end

get "/responder/save" do
  
  if Responder.add({"e_mail" => params["e_mail"], "age_id" => params["age_id"].to_i})
    @new = true
    erb :"responders/responder_saved"
  else
    @user = Responder.get_e_mail(params["e_mail"]).first 
    erb :"responders/edit_availability_form"
  end
  
end

get "/responder/e_mail_save" do

  user = Responder.find_as_object(params["id"].to_i).first
  new_email = params["e_mail"]
  user.e_mail = new_email
  user.save

  @responder_edit = true  
  erb :"responders/responder_saved"

end
