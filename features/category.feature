Feature: Test Category
  As a blog administrator
  In order to group my blogs, I need categories
  I want to be able to view, edit and create categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario:
    Given I am on the category page
    When I fill in "category_name" with "CatName"
    And I fill in "category_keywords" with "CatKey"
    And I fill in "category_permalink" with "TestPerma"
    And I fill in "category_description" with "Some description"
    And I press "Save"
    Then I should see "CatName"
    And I should be on the category page

  Scenario:
    Given A sample category is setup
    And I am on the category page
    When I follow "Edit"
    And I fill in "category_description" with "Updated description"
    And I press "Save"
    Then I should see "Updated description"
    And I should be on the category page

  Scenario:
    Given A sample category is setup
    And I am on the category edit page for "sample-cat"
    When I fill in "category_description" with "Updated description"
    And I press "Save"
    Then I should see "Updated description"
    And I should be on the category page
