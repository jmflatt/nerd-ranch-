Feature: I should be able to log in and see stuff

  Scenario: After logging in, I should see my email address in navbar
    Given i am an authenticated user
    And i see my email appear as logged in on the navbar
    Then i should be able to create a new post
