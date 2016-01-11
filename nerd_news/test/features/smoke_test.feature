Feature: The app should Be live

  Scenario: I should be able to see email after sign-in
    Given i am logged in as "joe@email.com"
    Then i should see verification that i am signed in
