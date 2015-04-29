package 'libsqlite3-dev'
package 'libxml2-dev'
package 'libxslt1-dev'
package 'make'
package 'ruby1.9.3'

cookbook_file 'webrick-config.rb' do
  path '/usr/lib/ruby/1.9.1/webrick/config.rb'
  mode '644'
end

execute 'install bundler' do
  command 'gem install bundler && touch /home/vagrant/bundler-installed'
  creates '/home/vagrant/bundler-installed'
end
