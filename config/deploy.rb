require 'bundler/capistrano'
load "deploy/assets"

set :application, "SOS Cloud App"
set :repository,  "git@github.com:jadercorrea/serviceorder.git"
set :deploy_to, "/var/www/serviceorder"
set :scm, :git
set :branch, "master"
set :user, "azureuser"
set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :copy
set :keep_releases, 5
default_run_options[:pty] = true
server "sos-app.cloudapp.net", :app, :web, :db, :primary => true

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "sos-app.cloudapp.net"                          # Your HTTP server, Apache/etc
role :app, "sos-app.cloudapp.net"                          # This may be the same as your `Web` server
role :db,  "sos-app.cloudapp.net", :primary => true # This is where Rails migrations will run
role :db,  "sos-app.cloudapp.net"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

#If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :symlinks do
  task :themes do
    run "rm -rf #{release_path}/public/themes/cloud"
    run "ln -nfs #{shared_path}/themes/cloud #{release_path}/public/themes/cloud"
  end

  task :database do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  task :uploads do
    run "ln -nfs #{shared_path}/uploads #{release_path}/public/uploads"
  end
end

after "deploy:finalize_update", "symlinks:database"
after "deploy:finalize_update", "symlinks:uploads"
after "deploy:finalize_update", "symlinks:themes"
