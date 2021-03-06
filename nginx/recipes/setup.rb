apt_repository 'nginx-php' do
  key          'http://nginx.org/keys/nginx_signing.key'
  uri          'ppa:nginx/stable'
  distribution node['lsb']['codename']
end
apt_update 'all platforms' do
  action :update
end
apt_package 'nginx' do
  action :install
  options '-yf'
end
apt_package 'php-fpm' do
  action :install
  options '-yf'
end
apt_package 'php-mysql' do
  action :install
  options '-yf'
end
apt_package 'php-gd' do
  action :install
  options '-yf'
end
file "/etc/nginx/sites-available/default" do
  owner 'root'
  group 'root'
  mode 0644
  content ::File.open("/var/chef/cookbooks/nginx/files/default").read
  action :create
end
service 'php-fpm' do
  supports status: true, restart: true, reload: true
  action :nothing
end
service 'nginx' do
  supports status: true, restart: true, reload: true
  action :enable
end

