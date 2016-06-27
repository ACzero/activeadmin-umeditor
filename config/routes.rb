ActiveAdmin::Umeditor::Engine.routes.draw do
  post '/images' => 'active_admin/umeditor/images#create'
end
