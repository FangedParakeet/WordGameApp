WordGameApp::Application.routes.draw do

  root to: "pages#home"
  
  post "play" => "pages#play", as: :play
  post "guess" => "pages#guess", as: :guess
  post "correct" => "pages#correct", as: :correct
  
end
