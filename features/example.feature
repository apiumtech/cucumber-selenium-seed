Feature: Checking the title of google.com

    Scenario: Google.com title should be 'Google'
        When I navigate to google.com
        Then the browser displays a website with the title Google
        And the website title is not Yahoo
