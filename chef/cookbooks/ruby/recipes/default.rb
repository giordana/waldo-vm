package 'ruby1.9.3'
package 'make'
package 'libxml2-dev'
package 'libxslt1-dev'
package 'libsqlite3-dev'

execute 'install bundler' do
  command 'gem install bundler && touch /home/vagrant/bundler-installed'
  user 'root'
  creates '/home/vagrant/bundler-installed'
  action :run
end