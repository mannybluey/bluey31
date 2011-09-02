set :stages, %w(staging production)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

set :application, "bluey_app"

# Use Git source control
set :scm, :git
set :repository,   "git@github.com:mannybluey/bluey31.git"

# Deploy from master branch by default
set :branch, "stable"
# set :deploy_via, :remote_cache
set :scm_verbose, true
# 
set :user, "blueybot"
set :password, 'J4m1r0q'
set :domain, "blueyfit.com"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :deploy_to, "/home/#{user}/#{application}/staging"
set :rails_env, "test"

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.2-p290@rails31'
set :rvm_type, :user

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with mod_rails"
    task t, :roles => :app do ; end
  end
  
  task :cold do       # Overriding the default deploy:cold
    update
    migrate
    # load_schema       # My own step, replacing migrations.
    start
  end

  task :migrate, :roles => :app do
     run "cd #{current_path}; rake db:migrate"
  end
   
  task :load_schema, :roles => :app do
    run "cd #{current_path}; rake db:seed"
  end
  
  task :symlink_shared do
    run "ln -sfn /home/#{user}/#{application}/shared/database.yml #{release_path}/config/database.yml"
    run "ln -sfn /home/#{user}/#{application}/shared/bluey.mov #{release_path}/public/videos/bluey.mov"
  end
  
  task :bundle_new_release, :roles => :app do
     run "cd #{current_path} && bundle install --without test"
   end

  after 'deploy:update_code', 'deploy:symlink_shared', 'deploy:bundle_new_release'
end
