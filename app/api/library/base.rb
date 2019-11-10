class Base < Grape::API
  mount Books
  mount Groups
end