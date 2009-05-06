ActionController::Routing::Routes.draw do |map|

  map.resources :answers, :card_sorts, :quizzes, :pageviews, :replies, :organizations, :initiatives, 
    :wireframes, :card_groups, :cards, :users

  map.root :controller => "about"

  map.connect 'participate', :controller => 'initiatives', :action => 'random'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

end
