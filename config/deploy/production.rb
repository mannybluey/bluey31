set :stages, %w(staging production)
set :default_stage, "staging"
require 'capistrano/ext/multistage'

set :application, "bluey_app"

# Use Git source control
set :scm, :git
set :repository,   "git@github.com:mannybluey/Bluey.git"

# Deploy from master branch by default
set :branch, "master"
set :deploy_via, :remote_cache
set :scm_verbose, true
# 
set :user, "blueybot"
set :password, 'J4m1r0q'
set :domain, "blueyfit.com"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

set :deploy_to, "/home/#{user}/#{application}/production"

set :default_environment, {
  'PATH' => '/home/blueybot/.rvm/gems/ruby-1.9.2-p180/bin:$PATH',
  'GEM_HOME' => '/home/blueybot/.rvm/gems/ruby-1.9.2-p180',
  'GEM_PATH' => '/home/blueybot/.rvm/gems/ruby-1.9.2-p180'
}

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
  
  task :symlink_shared do
    run "ln -sfn /home/#{user}/#{application}/shared/database.yml #{release_path}/config/database.yml"
    run "ln -sfn /home/#{user}/#{application}/shared/bluey.mov #{release_path}/public/videos/bluey.mov"
  end

  after 'deploy:update_code', 'deploy:symlink_shared'
end
