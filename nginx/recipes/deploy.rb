deploy 'wordpress' do
  repo 'https://github.com/WordPress/WordPress.git'
  user 'www-data'
  deploy_to '/var/www/html/'
  action :deploy
end
