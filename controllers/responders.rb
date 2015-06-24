#any responders controller items

get "/responder/add" do
  erb :"responders/add_responder_form"
end

get "/responder/save" do
  
  if Responder.add({"e_mail" => params["e_mail"], "age_id" => params["age_id"].to_i})
    @new = true
    erb :"responders/responder_saved"
  else
    erb :"responders/edit_availability_form"
  end
end

    
