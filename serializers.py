from datetime import date
from rest_framework import serializers

class StudentOnboardingSerializer(serializers.Serializer):
    student_id = serializers.RegexField(regex=r"^STU-[0-9]{6}$", max_length=10, required=True)
    student_name = serializers.CharField(min_length=2, max_length=100, trim_whitespace=True, required=True)
    date_of_birth = serializers.DateField(required=True)
    parent_email = serializers.EmailField(max_length=254, required=True)
    parent_phone = serializers.RegexField(regex=r"^[0-9]{10,15}$", min_length=10, max_length=15, required=True)
    learning_support_required = serializers.BooleanField(required=True)
    consent_given = serializers.BooleanField(required=True)
    region = serializers.ChoiceField(choices=["north", "south", "east", "west", "central"], required=True)

    def validate_student_name(self, value):
        value = " ".join(value.split())
        if not value.replace(" ", "").isalpha():
            raise serializers.ValidationError("Student name must contain alphabetic characters and spaces only.")
        return value

    def validate_date_of_birth(self, value):
        if value >= date.today():
            raise serializers.ValidationError("Date of birth must be earlier than the current date.")
        return value

    def validate_consent_given(self, value):
        if value is not True:
            raise serializers.ValidationError("Consent must be explicitly set to true.")
        return value
