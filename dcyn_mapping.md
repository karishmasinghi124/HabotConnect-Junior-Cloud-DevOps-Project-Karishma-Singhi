# DCYN Validation Library
| Field | Yes Condition | No Condition | Action |
|---|---|---|---|
| student_id | Exact identifier pattern passes | Pattern fails | Reject |
| student_name | Length and character rules pass | Any rule fails | Reject |
| date_of_birth | Earlier than current date | Current or future date | Reject |
| parent_email | Valid email format | Invalid format | Reject |
| parent_phone | 10 to 15 digits | Outside range or non-digits | Reject |
| learning_support_required | Boolean value | Non-Boolean | Reject |
| consent_given | Explicitly true | False or missing | Reject |
| region | Approved value | Unapproved value | Reject |

Final logic: all mandatory rules must return Yes. Any No rejects the record.
