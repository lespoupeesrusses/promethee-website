namespace :db do
  desc 'Get database from production environment'
  task :download do
    Bundler.with_clean_env do
      sh "heroku pg:backups capture --app promethee"
      sh "curl -o db/latest.dump `heroku pg:backups public-url --app promethee`"
      sh 'DISABLE_DATABASE_ENVIRONMENT_CHECK=1 bundle exec rails db:drop'
      sh 'bundle exec rails db:create'
      begin
        sh 'pg_restore --verbose --clean --no-acl --no-owner -h localhost -U postgres -d promethee_website_development db/latest.dump'
      rescue
        'There were some warnings or errors while restoring'
      end
      sh 'rails db:migrate'
    end
  end
end
