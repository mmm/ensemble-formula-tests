Users want to deploy services in ensemble.  Once they have defined a valid environment, they should be able to deploy drupal services in various configurations.

Story: Deploying Drupal
  As an ensemble user with a valid environment defined
  I want to create a drupal service in my ensemble
  So that I can manage web content

  Scenario: ensemble user can create a drupal service
    Given an ensemble user with a valid environment
    When  she runs 'ensemble deploy --repository=principia drupal'
    Then  she should see an immediate status message
    When  she waits a few minutes
     And  runs 'ensemble status'
    Then  she should see the drupal machine address
     And  the page should look AWESOME
     And  she should see a <form> containing a textfield: Login, password: Password, and submit: 'Log in'
  
  Scenario: ensemble user can create a drupal service with a separate database
    Given an ensemble user with a valid environment
     And  an activated user named 'reggie'
    When  she creates a singular sessions with login: 'reggie', password: 'monkey', remember me: ''
    Then  she should be redirected to the home page
    When  she follows that redirect!
    Then  she should see a notice message 'Logged in successfully'
     And  reggie should be logged in
     And  she should not have an auth_token cookie
   
