Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
      resources :parking do
        put 'pay', to: 'parking#pay'
        put 'out', to: 'parking#out'
      end
  	end
  end
end
