deploy 'wordpress' do
  repo 'https://github.com/WordPress/WordPress.git'
  user 'root'
  group 'root'
  action :deploy
end
