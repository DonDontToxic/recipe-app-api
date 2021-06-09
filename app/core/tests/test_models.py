from django.test import TestCase
from django.contrib.auth import get_user_model

class ModelTests(TestCase):
    # Must start with test_
    def test_create_user_with_email_sucessful(self):
        """Test creating a new user with an email is sucessufl"""
        email = "test@gmail.com"
        pwd = "test123"
        user = get_user_model().objects.create_user(
            email = email,
            password = pwd
        )

        self.assertEqual(user.email, email)
        self.assertTrue(user.check_password(pwd))


    def test_new_user_normalize(self):
        """ Test the email for a new user is normalize """
        email = "test@GMAIL.com"
        user = get_user_model().objects.create_user(email=email, password="pass")

        self.assertEqual(user.email, email.lower())

    def test_new_user_invalid_email(self):
        """ Test creating user with no email raises error """
        with self.assertRaises(ValueError):
            get_user_model().objects.create_user(None, "pass")

    def test_create_new_super_user(self):
        user = get_user_model().objects.create_superuser(
            'test@gmail.com',
            'adminpass'
        )
        self.assertTrue(user.is_superuser)
        self.assertTrue(user.is_staff)
