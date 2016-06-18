group node['myface']['group']

user node['myface']['user'] do
  group node['myface']['group']
  system true
  shell '/bin/bash'
end

include_recipe 'apache2'
