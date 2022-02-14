class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :lastname, :username
end
