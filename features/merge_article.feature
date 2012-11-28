Feature: Merge Articles
  As a blog administrator
  In order to keep the order in my blog
  I want to be able to merge two articles 

  Background:
    Given the blog is set up
    And blogger1 have created the article "I love BDD" with the content "<p>I really love BDD</p>"
    And a user have added "Much thinking" comment to the "I love BDD" article
    And a user have added "Much thinking" comment to the "I love BDD" article
    And blogger2 have created the article "Living with BDD" with the content "<p>How I started using cucumber</p>"
    And a user have added "That's a crap life" comment to the "Living with BDD" article
    
  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given I am logged as an admin
    And I am on the articles page
    When I follow "I love BDD"
    Then I should see "Merge Articles"
    When I fill in "article_id" with "Living with BDD" article id
    And I press "Merge"
    Then the "article_body_and_extended" field should contain "<p>I really love BDD</p><p>How I started using cucumber</p>"
    When I go to "I love BDD"
    Then I should see "3 comments"
    And I should see "Too much work"
    And I should see "Much thinking"
    And I should see "That's a crap life"

  Scenario: A non-admin cannot merge two articles
    Given I am logged as a non-admin
    And I am on the articles page
    When I follow "I love BDD"
    Then I should not see "Merge Articles"
