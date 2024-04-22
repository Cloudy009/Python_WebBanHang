# forms.py
from django import forms
from django.contrib.auth.forms import PasswordChangeForm
from django import forms


class CustomChangePasswordForm(PasswordChangeForm):
    phone_number = forms.CharField(
        required=False,
        widget=forms.TextInput(attrs={'placeholder': 'Phone Number...'})
    )
    address = forms.CharField(
        required=False,
        widget=forms.TextInput(attrs={'placeholder': 'Address...'})
    )

class ContactForm(forms.Form):
    name = forms.CharField(max_length=100)
    phone_number = forms.CharField(max_length=15)
    email = forms.EmailField()
    message = forms.CharField(widget=forms.Textarea)
