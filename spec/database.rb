require 'active_record'
Bundler.require 'db'

test_conf = case ENV['DB']
when 'mysql'
  system "mysql -uroot -e 'drop database cerbero_test; create database cerbero_test;'"
  {:adapter => 'mysql2', :database => 'cerbero_test', :username => 'root', :encoding => 'utf8'}
when 'postgres'
  system "`psql -c 'drop database cerbero_test;' -U postgres`"
  system "`psql -c 'create database cerbero_test;' -U postgres`"
  {:adapter => 'postgresql', :database => 'cerbero_test', :username => 'postgres'}
else
  {:adapter => 'sqlite3', :database => ':memory:', :timeout => 500}
end

ActiveRecord::Base.configurations = {'test' => test_conf}
ActiveRecord::Base.establish_connection('test')

ActiveRecord::Migration.verbose = false unless ENV.has_key?('DEBUG')
