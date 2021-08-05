Rails.application.routes.draw do

  get("/", {:controller => "users", :action => "homepage"})

  get("/users", {:controller => "users", :action => "index"})

  get("/users/:path_username", {:controller => "users", :action => "show"})

  get("/photos", {:controller => "photos", :action => "index"})

  get("/delete_photo/:path_id", :controller => "photos", :action => "delete")
  
  get("/photos/:path_id", {:controller => "photos", :action => "show"})

  get("/insert_photo_record", :controller => "photos", :action => "create")

  get("/insert_user_record", :controller => "users", :action => "create")

  get("/insert_comment_record", :controller => "photos", :action => "create_comment")

  get("/update_user/:path_id", {:controller => "users", :action => "update"})

  get("/update_photo/:path_id", {:controller => "photos", :action => "update"})
end
