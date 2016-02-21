Rails.application.routes.draw do
  root to: redirect('/browse/')
  get '/browse',            to: 'file_browser#show', as: 'file_browser_root', directory: ''
  get '/browse/*directory', to: 'file_browser#show', as: 'file_browser'
end
