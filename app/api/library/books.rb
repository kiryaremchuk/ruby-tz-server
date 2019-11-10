# frozen_string_literal: true
class Books < Grape::API
  version 'v1', using: :path
  format :json
  prefix 'api'

  resources :books do
    desc 'Get books'
    get '/' do
      response = []
      Book.all.each do |book|
        response << { name: book.name,
                      authors: book.authors.pluck(:name),
                      groups: book.groups.pluck(:name) }
      end
      response
    end

    desc 'Get books by group'
    get '/filtered' do
      books = Book.joins(:groups).where('groups.name = ?', params[:group])
      response = []
      books.each do |book|
        response << { name: book.name,
                      authors: book.authors.pluck(:name),
                      groups: book.groups.pluck(:name) }
      end
      response
    end
  end
end
