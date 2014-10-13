Rails.application.routes.draw do

  root to:      'sessions#new'
  # root to:      'questions#index'

  get   'home',   to: 'questions#index'
  post  'login',  to: 'sessions#create'
  get   'login',  to: 'sessions#new'
  get   'login',  to: 'sessions#new', as: 'sessions'
  delete   'logout', to: 'sessions#destroy'
  get   'question/:question_id/preview', to: 'questions#preview', as: 'preview_question'
  post  'answer/preview', to: 'answers#preview', as: 'preview_answer'
  get   'chapters/get_exam_chapters/:id', to: 'chapters#get_exam_chapters'


  resources :questions do
    resources :answers
  end

  resources :chapters

  resources :exams

end
