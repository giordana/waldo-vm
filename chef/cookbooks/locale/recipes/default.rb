execute 'Generating locale' do
  command 'locale-gen "en_US.UTF-8" && dpkg-reconfigure locales && touch /home/vagrant/locale-generated'
  creates '/home/vagrant/locale-generated'
  action :run
end

cookbook_file '/etc/default/locale' do
  mode '644'
end
