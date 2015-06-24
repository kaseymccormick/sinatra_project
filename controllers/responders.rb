#any responders controller items

get "/responder/add" do
  erb :"responders/add_responder_form"
end

get "/responder/save" do
  
  if Responder.add({"e_mail" => params["e_mail"], "age_id" => params["age_id"].to_i})
    @new = true
    erb :"responders/responder_saved"
  else
    binding.pry
    Responder.get("id")
    binding.pry
    erb :"responders/edit_availability_form"
  end
  
end
get "responder/e_mail_save" do
# need to have the form give me id and new email
responder = Responder.find(params["id"])
responder.e_mail = (params["new_e_mail"])
responder.save

@song_edit = true  
erb :"complete_song_list"
end
