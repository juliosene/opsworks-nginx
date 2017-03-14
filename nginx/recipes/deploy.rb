deploy 'wordpress' do
  path deploy[:deploy_to]
  user 'root'
  group 'root'
  action :deploy
end
