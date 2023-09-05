from django.shortcuts import render,redirect
from .models import *
from .forms import *
from django.contrib import messages
from django.http import HttpResponseBadRequest
from django.http import JsonResponse
from django.shortcuts import get_object_or_404

#auth imports
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .decorators import unauthenticated_user,admin_only

# Create your views here.

@unauthenticated_user
def login_user(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username,password=password)

        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            messages.info(request,'username or password is incorrect') 

    return render(request,'auth/login.html')


def logoutUser(request):
    logout(request)
    return redirect('login_user')


@login_required(login_url='login_user')
@admin_only
def home(request):
    query = Individual_lending.objects.filter(branch__user=request.user)[:1]
    count_group_loan = Group_lending.objects.all().count()
    count_individual_loan = Individual_lending.objects.all().count()
    count_branch = Branch.objects.all().count()
    context = {
        'count_group_loan':count_group_loan,
        'count_individual_loan':count_individual_loan,
        'count_branch':count_branch,
        'query':query,
    }

    return render(request,'pages/home.html',context)


@login_required(login_url='login_user')
@admin_only
def referee_individual(request):
    query = Individual_ref.objects.all()

    if request.method == 'POST':
            form = Individual_refForm(request.POST or None, request.FILES or None)
            if form.is_valid():
                add_ref = form.save(commit=False)
                # add_ref.user = request.user
                add_ref.save()
                messages.success(request, 'Referee added successfully')
            else:
                messages.error(request, 'Something went wrong')
            return redirect('referee_individual')
    else:
        form = Individual_refForm()
    return render(request, 'pages/indi-referee.html', {'form': form,'query':query})


@login_required(login_url='login_user')
@admin_only
def delete_ref(request,id):
    ref = Individual_ref.objects.get(id=id)
    ref.delete()
    messages.success(request,'Referee deleted successfully')
    return redirect('referee_individual')


@login_required(login_url='login_user')
@admin_only
def edit_ref(request,id):
    memb = Individual_ref.objects.get(id=id)
    form = Individual_refForm(request.POST or None,instance=memb)
    if form.is_valid():
        form.save()
        messages.success(request,'Referee updated successfuly')
        return redirect('referee_individual')
    context={
        'form':form,
    }
    return render(request,'pages/edit-referee.html',context)


@login_required(login_url='login_user')
@admin_only
def view_referee(request,id):
    details = Individual_ref.objects.get(id=id)
    context={
        'details': details,
    }
    return render(request,'pages/view-referee.html',context)


@login_required(login_url='login_user')
@admin_only
def individual_lending(request):
 
    # Filter lending data based on the user's branch
    query = Individual_lending.objects.filter(branch__user=request.user)

    if request.method == 'POST':
        form = Individual_lendingForm(request.POST or None)
        if form.is_valid():
            add_app=form.save(commit=False)
            add_app.save()
            messages.success(request,'lending info submitted successfully')
        else:
            messages.error(request,'something went wrong')
        return redirect('individual_lending')
    else:
        form = Individual_lendingForm()
    context={
        'form': form,
        'query': query,
    }    
    return render(request,'pages/indi-lending.html',context)


#function for return amount
@login_required(login_url='login_user')
@admin_only
def edit_individual_lending(request):
    if 'edit_id' in request.GET:
        edit_id = request.GET['edit_id']
        try:
            lending_entry = Individual_lending.objects.get(pk=edit_id)
        except Individual_lending.DoesNotExist:
            return HttpResponseBadRequest('Invalid edit_id')

        if request.method == 'POST':
            form = ReturnAmountForm(request.POST)
            if form.is_valid():
                returned_amount = form.cleaned_data['returned_amount']
                if returned_amount <= lending_entry.amount:
                    lending_entry.returned_amount = returned_amount
                    lending_entry.amount -= returned_amount

                    if lending_entry.returned_amount >= lending_entry.amount:
                       lending_entry.status = 'cleared'

                    lending_entry.save()
                    messages.success(request, 'Return amount recorded successfully')
                else:
                    messages.error(request, 'Returned amount cannot exceed the initial amount')
                return redirect('individual_lending')
        else:
            form = ReturnAmountForm()

        return render(request, 'pages/returnform.html', {'form': form, 'edit_id': edit_id})


@login_required(login_url='login_user')
@admin_only
def edit_individual(request,id):
    indi = Individual_lending.objects.get(id=id)
    form = Individual_lendingForm(request.POST or None,instance=indi)
    if form.is_valid():
        form.save()
        messages.success(request,'content updated successfuly')
        return redirect('individual_lending')
    context={
        'form':form,
    }
    return render(request, 'pages/indi-lending-edit.html', context)


@login_required(login_url='login_user')
@admin_only
def delete_individual(request,id):
    try:
        indi = Individual_lending.objects.get(id=id)
    except Individual_lending.DoesNotExist:
        return HttpResponseBadRequest('Invalid lending ID')

    if indi.amount != 0:
        messages.error(request, 'Cannot delete a lender with a non-zero amount')
    else:
        indi.delete()
        messages.success(request, 'Lender information deleted successfully')
    
    return redirect('individual_lending')



@login_required(login_url='login_user')
@admin_only
def view_individual(request,id):
    details = Individual_lending.objects.get(id=id)
    context={
        'details': details,
    }
    return render(request,'pages/view-individual-info.html',context)


#Member functions starts here
@login_required(login_url='login_user')
@admin_only
def add_member(request):
    query = Member.objects.all()
    if request.method == 'POST':
        form = MemberForm(request.POST or None, request.FILES or None)
        if form.is_valid():
            add_ref = form.save(commit=False)
            # add_ref.user = request.user
            add_ref.save()
            messages.success(request, 'Group member added successfully')
            return redirect('add_member')  # Redirect back to the same page
        else:
            messages.error(request, 'Something went wrong')
    else:
        form = MemberForm()

    return render(request, 'pages/add-member.html', {'form': form, 'query': query})



@login_required(login_url='login_user')
@admin_only
def delete_member(request,id):
    indi = Member.objects.get(id=id)
    indi.delete()
    messages.success(request,'Group member deleted successfully')
    return redirect('add_member')


@login_required(login_url='login_user')
@admin_only
def member_edit(request,id):
    memb = Member.objects.get(id=id)
    form = MemberForm(request.POST or None,instance=memb)
    if form.is_valid():
        form.save()
        messages.success(request,'Group member updated successfuly')
        return redirect('add_member')
    context={
        'form':form,
    }
    return render(request,'pages/edit-member.html',context)



@login_required(login_url='login_user')
@admin_only
def member_lending(request):
    # Filter lending data based on the user's branch
    query = Group_lending.objects.filter(branch__user=request.user)
    if request.method == 'POST':
        form = Group_lendingForm(request.POST)
        if form.is_valid():
            # Save the main form
            group_lending = form.save(commit=False)
            group_lending.save()

            # Handle ManyToMany fields (referee and members)
            referees = request.POST.getlist('referee')
            members = request.POST.getlist('members')

            group_lending.referee.set(referees)
            group_lending.members.set(members)

            messages.success(request, 'Lending info submitted successfully')
            return redirect('member_lending')
        else:
            messages.error(request, 'Something went wrong')
    else:
        form = Group_lendingForm()

    context = {
        'form': form,
        'query':query,
    }

    return render(request, 'pages/lending-member.html', context)

#group lending edit function
@login_required(login_url='login_user')
@admin_only
def member_lending_edit(request,id):
    memb = Group_lending.objects.get(id=id)
    form = Group_lendingForm(request.POST or None,instance=memb)
    if form.is_valid():
        form.save()
        messages.success(request,'content updated successfuly')
        return redirect('member_lending')
    context={
        'form':form,
    }
    return render(request,'pages/edit-lending-member.html',context)

#delete function for group lending
@login_required(login_url='login_user')
@admin_only
def delete_member_lending(request, id):
    try:
        memb = Group_lending.objects.get(id=id)
    except Group_lending.DoesNotExist:
        return HttpResponseBadRequest('Invalid lending ID')

    if memb.amount != 0:
        messages.error(request, 'Cannot delete a lender with a non-zero amount')
    else:
        memb.delete()
        messages.success(request, 'Lender information deleted successfully')
    
    return redirect('member_lending')

#function for group members to return amount
@login_required(login_url='login_user')
@admin_only
def edit_group_lending(request):
    if 'update_id' in request.GET:
        update_id = request.GET['update_id']
        try:
            lending_entry = Group_lending.objects.get(pk=update_id)
        except Group_lending.DoesNotExist:
            return HttpResponseBadRequest('Invalid update_id')

        if request.method == 'POST':
            form = ReturnAmountForm(request.POST)
            if form.is_valid():
                returned_amount = form.cleaned_data['returned_amount']
                if returned_amount <= lending_entry.amount:
                    lending_entry.returned_amount = returned_amount
                    lending_entry.amount -= returned_amount

                    if lending_entry.returned_amount >= lending_entry.amount:
                       lending_entry.status = 'cleared'

                    lending_entry.save()
                    messages.success(request, 'Return amount recorded successfully')
                else:
                    messages.error(request, 'Returned amount cannot exceed the initial amount')
                return redirect('member_lending')
        else:
            form = ReturnAmountForm()

        return render(request, 'pages/group-returnform.html', {'form': form, 'update_id': update_id})

#view group lending informations
@login_required(login_url='login_user')
@admin_only
def view_group_info(request,id):
    details = get_object_or_404(Group_lending,id=id)
    context={
        'details': details,
    }
    return render(request,'pages/view-group-info.html',context)

#add group function
@login_required(login_url='login_user')
@admin_only
def add_group(request):
    query = My_group.objects.all()
    if request.method == 'POST':
        form = My_groupForm(request.POST or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Group added successfully')
        else:
            messages.error(request,'Something went wrong')
        return redirect('add_group')
    else:
        form = My_groupForm()
    context={
        'form': form,
        'query':query,
    }
    return render(request, 'pages/group.html',context)

@login_required(login_url='login_user')
@admin_only
def delete_group(request,id):
    memb = My_group.objects.get(id=id)
    memb.delete()
    messages.success(request,'Group informations deleted successfully')
    return redirect('add_group')

@login_required(login_url='login_user')
@admin_only
def group_edit(request,id):
    memb = My_group.objects.get(id=id)
    form = My_groupForm(request.POST or None,instance=memb)
    if form.is_valid():
        form.save()
        messages.success(request,'Group informations updated successfuly')
        return redirect('add_group')
    context={
        'form':form,
    }
    return render(request,'pages/group-edit.html',context)
