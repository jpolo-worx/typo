Feature: Merge Articles
  As a blog administrator
  In order to keep the order in my blog
  I want to be able to merge two articles 

  Background:
    Given the blog is set up
    And blogger1 have created the article "I love BDD" with the content "<p>I really love BDD</p>"
    And a user have added "Much thinking" comment to the "I love BDD" article
    And a user have added "Too much work" comment to the "I love BDD" article
    And blogger2 have created the article "Living with BDD" with the content "<p>How I started using cucumber</p>"
    And a user have added "That is a crap life" comment to the "Living with BDD" article
    
  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged as an admin
    And I am on the articles page
    When I follow "I love BDD"
    Then I should see "Merge Articles"
    When I fill in "merge_with" with "Living with BDD" article id
    And I press "Merge"
    Then I should be on the articles page
    When I enter in the "I love BDD" article   
    Then I should see "I really love BDD"
    And I should see "How I started using cucumber"
    And I should see "3 comments"
    And I should see "Too much work"
    And I should see "Much thinking"
    And I should see "That is a crap life"

  Scenario: A non-admin cannot merge two articles
    Given I am logged as a non-admin
    And I am on the articles page
    When I follow "I love BDD"
    Then I should not see "Merge Articles"
