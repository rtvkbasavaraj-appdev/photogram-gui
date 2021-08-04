Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "homepage"})
  
  get("/users", {:controller => "users", :action => "index"})

  get("/users/:path_username", {:controller => "users", :action => "show"})

  get("/photos", {:controller => "photos", :action => "index"})

  get("/delete_photo/:path_id", :controller => "photos", :action => "delete")
  
  get("/photos/:path_id", {:controller => "photos", :action => "show"})

  
end
