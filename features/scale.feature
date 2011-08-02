Users want to scale drupal services in ensemble.  Once they have defined a valid environment and an existing drupal service, they should be able to dynamically scale that service by adding new units.

Story: Scaling Drupal
  As an ensemble user with a valid environment defined
  I want to scale an existing drupal service in my ensemble
  So that I can handle more load 

  Scenario: ensemble user can add new drupal service units to an existing drupal service
    Given an ensemble user with a valid environment
     And  an existing drupal service in that ensemble
    When  she runs 'ensemble add-unit drupal'
    Then  she should be redirected to the home page
    When  she follows that redirect!
    Then  she should see a notice message 'Logged in successfully'
     And  reggie should be logged in
     And  she should not have an auth_token cookie
  
