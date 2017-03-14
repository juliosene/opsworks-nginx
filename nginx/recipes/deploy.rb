deploy 'wordpress' do
  repo 'https://wordpress.org/latest.zip'
  user 'www-data'
  deploy_to '/var/www/html/'
  action :deploy
end
