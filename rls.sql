-- Apply after replacing with approved environment values.
-- The identity-to-region authorization mapping must be approved by the organization.
CREATE ROW ACCESS POLICY regional_analytics_access
ON `PROJECT_ID.d1_staged_enforced.student_onboarding`
GRANT TO ("group:ANALYTICS_GROUP_EMAIL")
FILTER USING (region = SESSION_USER());
