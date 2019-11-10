# frozen_string_literal: true
class Groups < Grape::API
  version 'v1', using: :path
  format :json
  prefix 'api'

  resources :groups do
    desc 'Get groups'
    get '/' do
      Group.select(:id, :name)
    end
  end
end
