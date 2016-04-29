# Cucumber-Selenium Seed: Ruby + Cucumber + Selenium-Webdriver + Chrome headless
Web-interaction tests seed. Feel free to use in your projects :)

## Installation:
You just need to have <a href=https://docs.docker.com/engine/installation/>Docker</a> installed to run your tests


## Running the tests:
In order to run your tests you just have to build and run the docker image.
The Dockerfile should not be modified, you just need to add the tests in the features directory.

To run the example tests just open a terminal and type:
`docker build -t tests .
docker run tests`

and you should see the running process ending with:
```
Feature: Checking the title of google.com

  Scenario: Google.com title should be 'Google'               # features/example.feature:3
    When I navigate to google.com                             # features/step_definitions/example.rb:3
    Then the browser displays a website with the title Google # features/step_definitions/example.rb:7
    And the website title is not Yahoo                        # features/step_definitions/example.rb:11

1 scenario (1 passed)
3 steps (3 passed)
```

## New tests:
The first steps for anyone who wants to learn to write test with cucumber should be to read their wiki, <a href=https://github.com/cucumber/cucumber/wiki/Gherkin>starting here</a>, for example.

Also, to learn how to use selenium to interact with the browser, you should check the <a href=https://github.com/SeleniumHQ/selenium/wiki/Ruby-Bindings>ruby bindings</a>.

Remember that if you want to access to your host from inside a docker container, you should use the docker0 interface of that container, in other words, your host will be located in the ip 172.17.0.1

