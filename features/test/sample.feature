Feature: test

  Scenario: Verify the login of gmail

   Given I have gmail url
   And I see Username to enter
   When I enter "personal_data" as username
    And I click "Next"
   And I enter "personal_data" as password
   And I click "Sign in"
   Then I will be able to login successfully