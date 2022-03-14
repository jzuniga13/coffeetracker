Rails.application.routes.draw do

  get("/", {:controller => "application", :action => "index"})

  get("/about", {:controller => "application", :action => "about"})

  # Routes for the Instruction resource:

  # CREATE
  get("/insert_instruction/:path_id", { :controller => "instructions", :action => "create" })
          
  # READ
  get("/instructions", { :controller => "instructions", :action => "index" })
  
  get("/instructions/:path_id", { :controller => "instructions", :action => "show" })
  
  # UPDATE
  
  post("/modify_instruction/:path_id", { :controller => "instructions", :action => "update" })
  
  # DELETE
  get("/delete_instruction/:path_id", { :controller => "instructions", :action => "destroy" })

  #------------------------------

  # Routes for the Brew resource:

  # CREATE
  post("/insert_brew", { :controller => "brews", :action => "create" })
          
  # READ
  get("/brew_method/:path_id", { :controller => "brews", :action => "brew_wizard_landing" })
  get("/brew_instructions/:path_id", {:controller => "brews", :action => "brew_wizard_instr"})
  get("/brews", { :controller => "brews", :action => "index" })
  get("/brews/:path_id", { :controller => "brews", :action => "show" })
  
  # UPDATE
  get("/insert_comments/:path_id", {:controller => "brews", :action => "brew_wizard_close"})
  get("/modify_brew/:path_id", { :controller => "brews", :action => "update" })
  
  # DELETE
  get("/delete_brew/:path_id", { :controller => "brews", :action => "destroy" })

  #------------------------------

  # Routes for the Favorite brew resource:

  # CREATE
  get("/insert_favorite_brew/:path_id", { :controller => "favorite_brews", :action => "create" })
          
  # READ
  get("/favorite_brews", { :controller => "favorite_brews", :action => "index" })
  
  get("/favorite_brews/:path_id", { :controller => "favorite_brews", :action => "show" })
  
  # UPDATE
  
  post("/modify_favorite_brew/:path_id", { :controller => "favorite_brews", :action => "update" })
  
  # DELETE
  get("/delete_favorite_brew/:path_id", { :controller => "favorite_brews", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Device resource:

  # CREATE
  post("/insert_device", { :controller => "devices", :action => "create" })
          
  # READ
  get("/devices", { :controller => "devices", :action => "index" })
  
  get("/devices/:path_id", { :controller => "devices", :action => "show" })
  
  # UPDATE
  
  post("/modify_device/:path_id", { :controller => "devices", :action => "update" })
  
  # DELETE
  get("/delete_device/:path_id", { :controller => "devices", :action => "destroy" })

  #------------------------------

  # Routes for the Roaster resource:

  # CREATE
  post("/insert_roaster", { :controller => "roasters", :action => "create" })
          
  # READ
  get("/roasters", { :controller => "roasters", :action => "index" })
  
  get("/roasters/:path_id", { :controller => "roasters", :action => "show" })
  
  # UPDATE
  
  post("/modify_roaster/:path_id", { :controller => "roasters", :action => "update" })
  post("/modify_roaster_image/:path_id", { :controller => "roasters", :action => "update_image" })
  
  # DELETE
  get("/delete_roaster/:path_id", { :controller => "roasters", :action => "destroy" })

  #------------------------------

  # Routes for the Bean resource:

  # CREATE
  post("/insert_bean", { :controller => "beans", :action => "create" })
          
  # READ
  get("/beans", { :controller => "beans", :action => "index" })
  
  get("/beans/:path_id", { :controller => "beans", :action => "show" })

  get("/beans/analytics/:path_id", {:controller => "beans", :action => "analytics"})
  
  # UPDATE
  
  post("/modify_bean/:path_id", { :controller => "beans", :action => "update" })
  
  # DELETE
  get("/delete_bean/:path_id", { :controller => "beans", :action => "destroy" })

  #------------------------------

end
