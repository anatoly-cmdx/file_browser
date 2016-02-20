Rails.application.routes.draw do
  root to: redirect('/browse/')
  get '/browse',            to: 'file_browser#show', directory: ''
  get '/browse/*directory', to: 'file_browser#show'
end
