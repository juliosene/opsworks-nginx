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
