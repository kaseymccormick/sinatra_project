##Event Availability Manager ###
The PIP (Person Initiating Poll) is the admin user who creates a poll that is sent to many users to figure out the best availability of the group. The PIP  will select a date range and send the survey to respondents to select their availible days. The system will then complie a list of days with the best availability for the PIP.



### Tables ###
*** responders ***
- id -> integer
- e_mail -> string
- age_id -> integer

*** timeframes ***
- id -> integer
- range -> string

*** available_times ***
- responders_id -> integer
- timeframes_id -> integer
- days_id (ONLY if I have time)

*** ages  ***
- id -> integer
- range -> string

*** days *** (ONLY if I have time)
- id -> integer
- date -> String

### Should ###
- a user should be able to select many available days/slots
- the PIP should be able to add/delete/modify *days* table 
- compare the available times and produce a list of best timeframe



### Should Not ###
- the PIP should NOT be able to add/delete/modify *timeframes* table 

