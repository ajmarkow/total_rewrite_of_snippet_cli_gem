# ./lib/tasks/codecov_upload.rake

# Not working currently, use bash <(curl -s https://codecov.io/bash) or codecov shell alias.
desc "Uploads most recent test run to Codecov.io"
task :codecov do
  puts `sh coverage/codecov.sh -f '/Users/ajmarkow/Documents/snippet_cli/coverage/coverage.xml' `
end
