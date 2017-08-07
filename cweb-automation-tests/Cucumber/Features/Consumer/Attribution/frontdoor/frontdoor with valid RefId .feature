@Team-Infra
@Web-bat-tier-0
@Web-bat-tier-1
Feature: User Access frontdoor with Ref interface makes Reso, Verify Attribution values

  Background:
  # Add setup steps to run before each Scenario
    Then I start with a new browser

  @Attribution

  @Attribution-frontdoor-ValidRef-Make

  Scenario Outline:  User Access restaurant site ( uses frontdoor with ValidRefID )makes Reso, Verify Attribution values
  Verify points and attribution values,  Points = 100 , BillingType = OTReso, PrimarySourceType = None
  Manual Case : Attribution - Pure RestREf Reso

    Given I set test domain to "<domain>"
    And I navigate to url "<url>"
    And I set reservation date to "<days_fwd>" days from today
    And I set party size to "<party_sz>"
    And I set reservation time to "<time>"
    And I click Find a Table Button and fill in anonymous user info
    And I complete reservation
    Then I connect to database "<database>" as "<login>"
    Then I verify Attribution "BillingType" equal to "OTReso"
    Then I verify Attribution "PrimarySourceType" equal to "RefID"
    Then I verify Attribution "ResPoints" equal to "100"

  @Region-NA @Domain-COM
  Scenarios:
    | domain | url                                                                        | days_fwd | party_sz | time    | database         | login               |
    | .com   | http://www.opentable.com/restaurant-search.aspx?rid=(COM-POP2-RID)&ref=407 | 2        | 2 people | 7:00 PM | webdb-na-primary | automation/aut0m8er |

  @Region-EU @Domain-CO.UK
  Scenarios:
    | domain | url                                                                            | days_fwd | party_sz | time  | database         | login               |
    | .co.uk | http://www.opentable.co.uk/restaurant-search.aspx?rid=(COUK-POP2-RID)&ref=1041 |    2     | 2 people | 19:00 | webdb-eu-primary | automation/aut0m8er |