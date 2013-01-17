WordGameApp::Application.routes.draw do

  root to: "pages#home"
  
  post "play" => "pages#play", as: :play
  
end
