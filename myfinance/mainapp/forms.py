from django.forms import ModelForm 
from .models import *
#authimports
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User, Group
from django import forms
#endauthimports


#manage users
class UserCreationForm(forms.Form):
    username = forms.CharField(widget=forms.TextInput(attrs={'class':'form-control','placeholder': 'Enter Username'}))
    password = forms.CharField(widget=forms.PasswordInput(attrs={'class':'form-control','placeholder': 'enter Password'}))
    group = forms.ModelChoiceField(queryset=Group.objects.all(), widget=forms.Select(attrs={'class':'form-control'}))


class CreateUserForm(UserCreationForm):
    class Meta:
        model = User
        fields = ['username','email','password1','password2']
#endmanageusers


class Individual_refForm(ModelForm):
    class Meta:
        model = Individual_ref

        fields=['first_name','last_name','phone_number','nida_number','address','location']

        widgets={
            'first_name':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter first name','required':'required'}), 
            'last_name':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter last name','required':'required'}),
            'phone_number':forms.NumberInput(attrs={'class':'form-control', 'placeholder':'Enter phone number','min':'0','required':'required'}),
            'nida_number':forms.NumberInput(attrs={'class':'form-control','placeholder':'Enter nida number','required':'required'}),
            'address':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter address','required':'required'}),
            'location':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter location','required':'required'}),
        }

class Individual_lendingForm(ModelForm):
    class Meta:
        model = Individual_lending

        fields=['branch','lender_name','phone_number','nida_number','address','location','occupation','referee','amount','returned_amount','interest','lending_date','date_of_return']
        widgets={
            'branch':forms.Select(attrs={'class':'form-control'}),
            'lender_name':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter lender name','required':'required'}),
            'phone_number':forms.NumberInput(attrs={'class':'form-control', 'placeholder':'Enter phone number','min':'0','required':'required'}),
            'nida_number':forms.NumberInput(attrs={'class':'form-control','placeholder':'Enter nida number','required':'required'}),
            'address':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter address','required':'required'}),
            'location':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter location','required':'required'}),
            'occupation':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter occupation name','required':'required'}),
            'referee':forms.Select(attrs={'class':'form-control'}),
            'amount':forms.NumberInput(attrs={'class':'form-control','min':'0','placeholder':'Enter amount'}),
            'returned_amount':forms.NumberInput(attrs={'class':'form-control','min':'0','placeholder':'Enter return amount'}),
            'interest':forms.NumberInput(attrs={'class':'form-control','min':'0','placeholder':'Enter interest amount'}),
            'lending_date':forms.DateInput(attrs={'class':'form-control', 'type':'date','required':'required'}),
            'date_of_return':forms.DateInput(attrs={'class':'form-control', 'type':'date','required':'required'}),
        }

class ReturnAmountForm(forms.ModelForm):
    class Meta:
        model = Individual_lending
        fields = ['returned_amount']

    returned_amount = forms.FloatField(
        label='Return Amount',
        widget=forms.NumberInput(attrs={
            'class': 'form-control',
            'step': '0.01',
            'min': '0.0',
            'placeholder': 'Enter return amount',
            'required': 'required',
        })
    )


class MemberForm(ModelForm):
    class Meta:
        model = Member
        fields=['group_name','first_name','last_name','phone_number','nida_number','address','location','occupation']

        widgets={
            'group_name':forms.Select(attrs={'class':'form-control'}),
            'first_name':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter first name','required':'required'}), 
            'last_name':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter last name','required':'required'}),
            'phone_number':forms.NumberInput(attrs={'class':'form-control', 'placeholder':'Enter phone number','min':'0','required':'required'}),
            'nida_number':forms.NumberInput(attrs={'class':'form-control','placeholder':'Enter nida number','required':'required'}),
            'address':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter address','required':'required'}),
            'location':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter location','required':'required'}),
            'occupation':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter occupation','required':'required'}),

        }

class Group_lendingForm(ModelForm):
    class Meta:
        model = Group_lending

        fields=['branch','group_name','phone_number','referee','members','amount','returned_amount','interest','lending_date','date_of_return']
        widgets={
            'branch':forms.Select(attrs={'class':'form-control'}),
            'group_name':forms.Select(attrs={'class':'form-control'}),
            'phone_number':forms.NumberInput(attrs={'class':'form-control', 'placeholder':'Enter phone number','min':'0','required':'required'}),
            'referee':forms.SelectMultiple(attrs={'class':'form-control','placeholder':'Enter nida number','required':'required'}),
            'members':forms.SelectMultiple(attrs={'class':'form-control','placeholder':'Enter address','required':'required'}),
            'amount':forms.NumberInput(attrs={'class':'form-control','min':'0','placeholder':'Enter amount'}),
            'returned_amount':forms.NumberInput(attrs={'class':'form-control','min':'0','placeholder':'Enter return amount'}),
            'interest':forms.NumberInput(attrs={'class':'form-control','min':'0','placeholder':'Enter interest amount'}),
            'lending_date':forms.DateInput(attrs={'class':'form-control', 'type':'date','required':'required'}),
            'date_of_return':forms.DateInput(attrs={'class':'form-control', 'type':'date','required':'required'}),
        }


class My_groupForm(ModelForm):
    class Meta:
        model = My_group

        fields=['group_name','group_leader','date_of_registration']
        widgets={
            'group_name':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter group name','required':'required'}),
            'group_leader':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter group leader','required':'required'}),
            'date_of_registration':forms.DateInput(attrs={'class':'form-control', 'type':'date','required':'required'}),
        }

class BranchForm(ModelForm):
    class Meta:
        model = Branch

        fields=['name','date_of_registration','user']
        widgets={
            'name':forms.TextInput(attrs={'class':'form-control','placeholder':'Enter branch name','required':'required'}),
            'date_of_registration':forms.DateInput(attrs={'class':'form-control', 'type':'date','required':'required'}),
             'user':forms.Select(attrs={'class':'form-control','placeholder':'Select user','required':'required'}),
        }


class ChangeStatusForm(forms.ModelForm):
    class Meta:
        model = Group_lending
        fields = ['status']
        widgets = {
            'status': forms.Select(attrs={'class': 'form-control'}),
        }


class ChangeForm(forms.ModelForm):
    class Meta:
        model = Individual_lending
        fields = ['status']
        widgets = {
            'status': forms.Select(attrs={'class': 'form-control'}),
        }