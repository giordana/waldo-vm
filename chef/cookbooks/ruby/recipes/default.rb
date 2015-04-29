package 'libsqlite3-dev'
package 'libxml2-dev'
package 'libxslt1-dev'
package 'make'
package 'ruby1.9.3'

execute 'install bundler' do
  command 'gem install bundler && touch /home/vagrant/bundler-installed'
  user 'root'
  creates '/home/vagrant/bundler-installed'
end

execute 'install gems' do
  command 'bundle install'
  cwd '/vagrant'
  user 'vagrant'
end
