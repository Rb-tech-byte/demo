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
from .decorators import unauthenticated_user,allowed_users,admin_only


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def admin_home(request):
    count_group_loan = Group_lending.objects.all().count()
    count_individual_loan = Individual_lending.objects.all().count()
    count_branch = Branch.objects.all().count()

    group_amount = Group_lending.objects.aggregate(models.Sum('amount'))['amount__sum']
    indi_amount =Individual_lending.objects.aggregate(models.Sum('amount'))['amount__sum']

    context = {
        'count_group_loan':count_group_loan,
        'count_individual_loan':count_individual_loan,
        'count_branch':count_branch,
        'group_amount':group_amount,
        'indi_amount':indi_amount,
    }
    return render(request,'ceo/dashboard.html',context)


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def add_branch(request):
    query = Branch.objects.prefetch_related('user')
    if request.method == 'POST':
        form = BranchForm(request.POST)
        if form.is_valid():
            form.save()
            form = BranchForm()
            messages.success(request,'Branch added successfully')
        else:
            messages.error(request,'something went wrong')
    else:
        form = BranchForm()
    context={
        'form':form,
        'query':query,
    }
    return render(request,'ceo/add-branch.html',context)


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def delete_branch(request,id):
    br = Branch.objects.get(id=id)
    br.delete()
    messages.success(request,'Branch deleted successfully')
    return redirect('add_branch')

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def edit_branch(request,id):
    branch = Branch.objects.get(id=id)
    form = BranchForm(request.POST or None,instance=branch)
    if form.is_valid():
        form.save()
        messages.success(request,'Branch updated successfuly')
        return redirect('add_branch')
    context={
        'form':form,
    }
    return render(request,'ceo/edit-branch.html',context)

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def referee(request):
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
            return redirect('referee')
    else:
        form = Individual_refForm()
    return render(request, 'ceo/referee.html', {'form': form,'query':query})

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def delete_referee(request,id):
    ref = Individual_ref.objects.get(id=id)
    ref.delete()
    messages.success(request,'Referee deleted successfully')
    return redirect('referee')

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def edit_referee(request,id):
    memb = Individual_ref.objects.get(id=id)
    form = Individual_refForm(request.POST or None,instance=memb)
    if form.is_valid():
        form.save()
        messages.success(request,'Referee updated successfuly')
        return redirect('referee')
    context={
        'form':form,
    }
    return render(request,'pages/edit-referee.html',context)

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def manage_users(request):
    users = User.objects.all()
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']
            group = form.cleaned_data['group']

            if User.objects.filter(username=username).exists():
                messages.error(request, 'Username already exists.')
            else:
                user = User.objects.create_user(username=username, password=password)
                group.user_set.add(user)
                messages.success(request, 'User added successfully.')

            return redirect('manage_users')
    else:
        form = UserCreationForm()
    
    return render(request, 'ceo/manage_users.html', {'form': form,'users':users})


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def delete_users(request,id):
    u = User.objects.get(id=id).delete()
    if u:
       messages.success(request,'user deleted')
    return redirect('manage_users')

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def lending_individual(request):
    query = Individual_lending.objects.all()
    if request.method == 'POST':
        form = Individual_lendingForm(request.POST or None)
        if form.is_valid():
            add_app=form.save(commit=False)
            add_app.save()
            messages.success(request,'lending info submitted successfully')
        else:
            messages.error(request,'something went wrong')
        return redirect('lending_individual')
    else:
        form = Individual_lendingForm()
    context={
        'form': form,
        'query': query,
    }    
    return render(request,'ceo/individual-lending.html',context)

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def lending_individual_update(request):
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
                return redirect('lending_individual')
        else:
            form = ReturnAmountForm()

        return render(request, 'ceo/returnform.html', {'form': form, 'edit_id': edit_id})


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def delete_lending(request,id):
    try:
        indi = Individual_lending.objects.get(id=id)
    except Individual_lending.DoesNotExist:
        return HttpResponseBadRequest('Invalid lending ID')

    if indi.amount != 0:
        messages.error(request, 'Cannot delete a lender with a non-zero amount')
    else:
        indi.delete()
        messages.success(request, 'Lender information deleted successfully')
    
    return redirect('lending_individual')


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def update_individual_lending(request,id):
    indi = Individual_lending.objects.get(id=id)
    form = Individual_lendingForm(request.POST or None,instance=indi)
    if form.is_valid():
        form.save()
        messages.success(request,'content updated successfuly')
        return redirect('lending_individual')
    context={
        'form':form,
    }
    return render(request, 'ceo/edit-individual-lending.html', context)


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def view_lending(request,id):
    details = Individual_lending.objects.get(id=id)
    context={
        'details': details,
    }
    return render(request,'ceo/view-lending.html',context)


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def add_new_group(request):
    query = My_group.objects.all()
    if request.method == 'POST':
        form = My_groupForm(request.POST or None)
        if form.is_valid():
            form.save()
            messages.success(request,'Group added successfully')
        else:
            messages.error(request,'Something went wrong')
        return redirect('add_new_group')
    else:
        form = My_groupForm()
    context={
        'form': form,
        'query':query,
    }
    return render(request, 'ceo/group.html',context)

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def delete_group_info(request,id):
    memb = My_group.objects.get(id=id)
    memb.delete()
    messages.success(request,'Group informations deleted successfully')
    return redirect('add_new_group')

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def new_group_edit(request,id):
    memb = My_group.objects.get(id=id)
    form = My_groupForm(request.POST or None,instance=memb)
    if form.is_valid():
        form.save()
        messages.success(request,'Group informations updated successfuly')
        return redirect('add_new_group')
    context={
        'form':form,
    }
    return render(request,'ceo/group-edit.html',context)

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def add_new_member(request):
    query = Member.objects.all()
    if request.method == 'POST':
        form = MemberForm(request.POST or None, request.FILES or None)
        if form.is_valid():
            add_ref = form.save(commit=False)
            # add_ref.user = request.user
            add_ref.save()
            messages.success(request, 'Group member added successfully')
            return redirect('add_new_member')  # Redirect back to the same page
        else:
            messages.error(request, 'Something went wrong')
    else:
        form = MemberForm()

    return render(request, 'ceo/member.html', {'form': form, 'query': query})

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def member_delete(request,id):
    indi = Member.objects.get(id=id)
    indi.delete()
    messages.success(request,'Group member deleted successfully')
    return redirect('add_new_member')

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def new_member_edit(request,id):
    memb = Member.objects.get(id=id)
    form = MemberForm(request.POST or None,instance=memb)
    if form.is_valid():
        form.save()
        messages.success(request,'Group member updated successfuly')
        return redirect('add_new_member')
    context={
        'form':form,
    }
    return render(request,'ceo/edit-member.html',context)

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def group_lending(request):
    query = Group_lending.objects.all()
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
            return redirect('group_lending')
        else:
            messages.error(request, 'Something went wrong')
    else:
        form = Group_lendingForm()

    context = {
        'form': form,
        'query':query,
    }

    return render(request, 'ceo/group-lending.html', context)

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def delete_groups(request,id):
    try:
        memb = Group_lending.objects.get(id=id)
    except Group_lending.DoesNotExist:
        return HttpResponseBadRequest('Invalid lending ID')

    if memb.amount != 0:
        messages.error(request, 'Cannot delete a lender with a non-zero amount')
    else:
        memb.delete()
        messages.success(request, 'Lender information deleted successfully')  
    return redirect('group_lending')

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def return_loan(request):
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
                return redirect('group_lending')
        else:
            form = ReturnAmountForm()

        return render(request, 'ceo/group-returnform.html', {'form': form, 'update_id': update_id})

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def group_lending_edit(request,id):
    memb = Group_lending.objects.get(id=id)
    form = Group_lendingForm(request.POST or None,instance=memb)
    if form.is_valid():
        form.save()
        messages.success(request,'content updated successfuly')
        return redirect('group_lending')
    context={
        'form':form,
    }
    return render(request,'ceo/edit-lending-member.html',context)

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def view_group_loan(request,id):
    details = get_object_or_404(Group_lending,id=id)
    context={
        'details': details,
    }
    return render(request,'ceo/view-group-loan.html',context)


@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def edit_app(request, id):
    appli = get_object_or_404(Group_lending, id=id)

    if request.method == 'POST':
        form = ChangeStatusForm(request.POST, instance=appli)
        if form.is_valid():
            form.save()
            messages.success(request, 'Status changed successfully')
            return redirect('group_lending')
    else:
        form = ChangeStatusForm(instance=appli)

    context = {
        'form': form,
    }
    return render(request, 'ceo/status.html', context)

@login_required(login_url='login_user')
@allowed_users(allowed_roles=['admin'])
def edit_app_status(request, id):
    appli = get_object_or_404(Individual_lending, id=id)

    if request.method == 'POST':
        form = ChangeForm(request.POST, instance=appli)
        if form.is_valid():
            form.save()
            messages.success(request, 'Status changed successfully')
            return redirect('lending_individual')
    else:
        form = ChangeForm(instance=appli)

    context = {
        'form': form,
    }
    return render(request, 'ceo/individual-status.html', context)