# About

Following the example in [Engineering Software as a Service: An Agile Approach Using Cloud Computing](http://www.saasbook.info), a course in software engineering focusing on cloud computing,
software as a service (SaaS), and Agile development using Extreme Programming (XP).

Topics include:

1. Introduction to SaaS and Agile Development
2. The Architecture of SaaS Applications
3. SaaS Framework: Introduction to Ruby
4. SaaS Framework: Introduction to Rails
5. SaaS Framework: Advanced Rails
6. SaaS Client Framework: JavaScript Introduction
7. Requirements: BDD and User Stories
8. Testing: Test-Driven Development
9. Maintenance: Legacy, Refactoring, and Agile
10. Project Management: Scrum, Pairs, and VCS
11. Design Patterns for SaaS Classes
12. Performance, Releases, Reliability, and Security

## Running RottenPotatoes for the first time

Open up a terminal and `cd` to the project root directory.

You will need a secret key and a Twitter developer API key and secret to run the app.
* To obtain a secret key, run `$ rake secret`. The returned string can be used as your secret key for this app.
* To obtain a Twitter API key and secret, log into [Twitter Application Management](https://apps.twitter.com) page with your Twitter account, and then click "Create New App". You should find the API key and secret under the "Keys and Access Tokens" once the app is created.

Once you have obtained the needed keys, create a file at `config/secrets.yml` with the following contents:

    development:
      secret_key_base: _insert_string_returned_by_rake_secret_
      TWITTER_KEY: _insert_your_twitter_api_key_
      TWITTER_SECRET: _insert_your_twitter_api_secret_

    test:
      secret_key_base: _insert_string_returned_by_rake_secret_
      TWITTER_KEY: _insert_your_twitter_api_key_
      TWITTER_SECRET: _insert_your_twitter_api_secret_

    # Do not keep production secrets in the repository,
    # instead read values from the environment.
    production:
      secret_key_base: <%= ENV["SECRET_KEY_BASE"] %>
      TWITTER_KEY: <%= ENV["TWITTER_KEY"] %>
      TWITTER_SECRET: <%= ENV["TWITTER_SECRET"] %>



Then run the following commands:

    $ bundle install
    $ rake db:migrate
    $ rake db:seed

    $ rails server


Then open up a web browser and visit `localhost:3000`.
