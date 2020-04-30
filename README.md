# Search GitHub repositories

A simple page with a simple form to display paginated results. With some Ajax instead of classical MVC, and some Bootsrap for the layout.

## System dependencies
- ruby version is 2.6.3
- firefox installed with the geckodriver since there is Capybara/Selenium tests. But I guess it can work well with Chrome/Chromium too since I did not set what browser to use in the local part of the rails_helper.

## install of the web app
- classically: bundle install
- Docker: cd path/to/mystery_folder then docker-compose up

### start of the web app
- rails s
- http://localhost:3000/repos


## The Gems I have used:
- Bootstrap (Front End)
- rspec (unit + feature testing)
- Simplecov (code coverage)
- Capybara (Acceptance test)
- Selenium (Feature testing)
- Octokit wrapper to access GitHub API
- Kaminari for the pagination
- rubocop (code quality)

