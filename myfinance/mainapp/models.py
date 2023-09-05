from django.db import models
from django.contrib.auth.models import User
from django.utils import timezone
from django.core.validators import MaxLengthValidator


# Create your models here.
class My_group(models.Model):
    group_name=models.CharField(max_length=200,blank=True,null=True)
    group_leader = models.CharField(max_length=200,blank=True,null=True)
    date_of_registration = models.DateField(null=True, blank=True)

    def __str__(self):
        return self.group_name
    

class Individual_ref(models.Model):
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=200,null=True, blank=True)
    last_name = models.CharField(max_length=200,null=True,blank=True)
    phone_number = models.CharField(max_length=10,default=None)
    nida_number = models.CharField(max_length=20,default=None, validators=[MaxLengthValidator(limit_value=20)])
    address = models.CharField(max_length=20,default=None)
    location = models.CharField(max_length=100,default=None)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"
 


class Branch(models.Model):
    user = models.ForeignKey(User,null=True,blank=True, on_delete=models.SET_NULL)
    name = models.CharField(max_length=200,null=True, blank=True)
    date_of_registration = models.DateField(null=True, blank=True)

    def __str__(self):
        return self.name



class Individual_lending(models.Model):
    STATTUS=(
        ('pending','pending'),
        ('approved','approved'),
        ('rejected','rejected'),
        ('cleared','cleared'),
    )
    branch = models.ForeignKey(Branch,null=True,blank=True, on_delete=models.CASCADE)
    lender_name=models.CharField(max_length=200,null=True, blank=True)
    phone_number=models.CharField(max_length=200,null=True, blank=True)
    nida_number=models.CharField(max_length=200,null=True,blank=True)
    address=models.CharField(max_length=200,null=True, blank=True)
    location=models.CharField(max_length=200,null=True, blank=True)
    occupation=models.CharField(max_length=200,null=True, blank=True)
    referee = models.ForeignKey(Individual_ref,null=True,blank=True, on_delete=models.CASCADE)
    amount=models.FloatField(null=True, blank=True)
    returned_amount=models.FloatField(null=True, blank=True, default='0.0')
    interest = models.FloatField(null=True, blank=True, default='0.0')
    lending_date =models.DateField(null=True, blank=True)
    date_of_return=models.DateField(null=True, blank=True)
    status = models.CharField(max_length=50,choices=STATTUS,default='pending')
    
    def __str__(self):
        return self.lender_name


class Member(models.Model):
    group_name = models.ForeignKey(My_group,null=True,blank=True, on_delete=models.CASCADE)
    first_name = models.CharField(max_length=200,null=True, blank=True)
    last_name = models.CharField(max_length=200,null=True,blank=True)
    phone_number = models.CharField(max_length=10,default=None)
    nida_number = models.CharField(max_length=21,default=None)
    address = models.CharField(max_length=20,default=None)
    location = models.CharField(max_length=100,default=None)
    occupation=models.CharField(max_length=200,null=True, blank=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"


class Group_lending(models.Model):
    STATTUS=(
        ('pending','pending'),
        ('approved','approved'),
        ('rejected','rejected'),
        ('cleared','cleared'),
    )
    branch = models.ForeignKey(Branch,null=True,blank=True, on_delete=models.CASCADE)
    group_name = models.ForeignKey(My_group,null=True,blank=True, on_delete=models.CASCADE)
    phone_number=models.CharField(max_length=200,null=True, blank=True)
    referee = models.ManyToManyField(Individual_ref)
    members = models.ManyToManyField(Member)
    amount=models.FloatField(null=True, blank=True)
    returned_amount=models.FloatField(null=True, blank=True, default='0.0')
    interest = models.FloatField(null=True, blank=True, default='0.0')
    lending_date =models.DateField(null=True, blank=True)
    date_of_return=models.DateField(null=True, blank=True)
    status = models.CharField(max_length=50,choices=STATTUS,default='pending')
    
    def __str__(self):
        return self.group_name
    


    
