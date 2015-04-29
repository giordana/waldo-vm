package 'postgresql-9.1'
package 'libpq-dev'

service 'postgresql' do
  action [:enable, :start]
end

execute 'creates default database user' do
  command 'createuser --superuser vagrant && touch /var/lib/postgresql/vagrant-role-created'
  user 'postgres'
  creates '/var/lib/postgresql/vagrant-role-created'
  action :run
end

execute 'updates default database user password' do
  command 'psql --command="alter user vagrant with password \'vagrant\'" && touch /var/lib/postgresql/vagrant-password-updated'
  user 'postgres'
  creates '/var/lib/postgresql/vagrant-password-updated'
  action :run
end

execute 'creates default database' do
  command 'createdb vagrant -E UTF8 --locale=en_US.utf8 -T template0 && touch /home/vagrant/default-db-created'
  user 'vagrant'
  creates '/home/vagrant/default-db-created'
  action :run
end

cookbook_file '/etc/profile.d/database_url.sh' do
  mode '744'
end

cookbook_file 'pgpass' do
  path '/home/vagrant/.pgpass'
  mode '0600'
end
