# Student Onboarding Schema
| Field | Data Type | Required | Validation Rule |
|---|---|---|---|
| student_id | String | Yes | STU- followed by exactly six digits |
| student_name | String | Yes | 2 to 100 characters; alphabetic characters and spaces |
| date_of_birth | Date | Yes | Earlier than the current date |
| parent_email | Email | Yes | Valid email format; maximum 254 characters |
| parent_phone | String | Yes | 10 to 15 digits |
| learning_support_required | Boolean | Yes | True or False |
| consent_given | Boolean | Yes | Must be True |
| region | String | Yes | north, south, east, west, or central |
