@javascript
Feature: As a user I want to assign tags to stories so that I can categorize stories by subject.
  Scenario: Adding a tag
    Given I'm editing a story
    When I add a tag
    Then there should be a tag on my story

  Scenario: Removing a tag
    Given I'm editing a story
    And I have a tag 
    When I remove the tag 
    Then I should no longer have a tag on my story

  @wip
  Scenario: Autocompleting previously entered tags
    Given I'm editing a story
    And I have previously entered a tag that is not on my story
    When I type in that tags name
    Then it should autocomplete that tags name

  Scenario: Viewing tags on a story
    Given I have previously entered in a tag on a story
    When I visit the stories page
    Then I should see my story with a tag on it

  Scenario: Filtering by tags
    Given I have previously entered in a tag on a story
    When I visit the stories page
    And I click_on a tag
    Then I should see a filtered list of stories by tag

  Scenario: Tag entry appears as a large input
    Given I'm editing a story
    When I start to enter a tag
    Then the tag input should appear large
