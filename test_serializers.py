import pytest
from backend.serializers import StudentOnboardingSerializer

VALID_PAYLOAD = {
    "student_id": "STU-123456",
    "student_name": "Aarav Sharma",
    "date_of_birth": "2015-06-15",
    "parent_email": "parent@example.com",
    "parent_phone": "9876543210",
    "learning_support_required": True,
    "consent_given": True,
    "region": "central",
}

@pytest.mark.parametrize("field,value", [
    ("student_id", "INVALID"),
    ("student_name", "A"),
    ("parent_email", "invalid-email"),
    ("parent_phone", "123"),
    ("consent_given", False),
    ("region", "unknown"),
])
def test_invalid_fields_fail_validation(field, value):
    payload = VALID_PAYLOAD.copy()
    payload[field] = value
    assert StudentOnboardingSerializer(data=payload).is_valid() is False

def test_valid_payload_passes_validation():
    assert StudentOnboardingSerializer(data=VALID_PAYLOAD).is_valid() is True

def test_future_date_of_birth_fails_validation():
    payload = VALID_PAYLOAD.copy()
    payload["date_of_birth"] = "2099-01-01"
    assert StudentOnboardingSerializer(data=payload).is_valid() is False
