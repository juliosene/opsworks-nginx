app = search("aws_opsworks_app").first
Chef::Log.info("********** #node[:deploy][:wordpress][:deploy_to] *** The app's short name is '#{app['shortname']}' **********")
Chef::Log.info("********** The app's URL is '#{app['app_source']['url']}' **********")

search("aws_opsworks_app").each do |app|
  Chef::Log.info("********** The app's short name is '#{app['shortname']}' **********")
  Chef::Log.info("********** The app's URL is '#{app['app_source']['url']}' **********")
end
deploy 'wordpress' do
  path 'https://github.com/WordPress/WordPress.git'
  user 'root'
  group 'root'
  action :deploy
end
