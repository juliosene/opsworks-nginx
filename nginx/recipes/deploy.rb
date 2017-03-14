app = search("aws_opsworks_app").first
Chef::Log.info("********** #node[:deploy][:wordpress][:deploy_to] *** The app's short name is '#{app['shortname']}' **********")
Chef::Log.info("********** The app's URL is '#{app['app_source']['url']}' **********")

search("aws_opsworks_app").each do |app|
  Chef::Log.info("********** The app's short name is '#{app['shortname']}' **********")
  Chef::Log.info("********** The app's URL is '#{app['app_source']['url']}' **********")
end
deploy 'wordpress' do
  repo 'https://github.com/WordPress/WordPress.git'
  deploy_to '/var/www/html'
  symlink_before_migrate Hash.new
  user 'www-data'
  group 'www-data'
  action :deploy
end
file '/var/www/html/current/hc.html' do
  content '<html>This is a page for the health check.</html>'
  mode '0644'
  owner 'www-data'
  group 'www-data'
  action :create
end
