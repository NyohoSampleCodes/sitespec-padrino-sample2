desc "Test task"
task :test => :environment do
  app = Sample2::App.new
  app.test_task
end
