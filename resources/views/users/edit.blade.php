@extends('layouts.global')


@section('title')
Edit User
@endsection

@section('content')
<div class="col-md-8">

    @if (session('status'))
    <div class="alert alert-success">
        {{session('status')}}
    </div>
    @endif

    <form action="{{route('users.update', [$user->id])}}" method="POST" enctype="multipart/form-data"
        class="bg-white shadow-sm p-3">
        @method('PUT')
        @csrf

        <label for="name">Name</label>
        <input type="text" class="form-control {{$errors->first('name') ? "is-invalid" : ""}}" placeholder="Full Name" name="name" id="name" value="{{old('name') ? old('name') : $user->name}}">
        <div class="invalid-feedback">
            {{$errors->first('name')}}
        </div>
        <br>
        
        <label for="username">Username</label>
        <input class="form-control" type="text" placeholder="username" name="username" id="username" value="{{$user->username}}" disabled>
        <br>

        <label for="status">Status</label>
        <br>
        <input {{$user->status == "ACTIVE" ? "checked" : ""}} value="ACTIVE" type="radio" class="form-control"
            id="active" name="status">
        <label for="active">Active</label>
        <input {{$user->status == "INACTIVE" ? "checked" : ""}} value="INACTIVE" type="radio" class="form-control" id="inactive" name="status">
        <label for="inactive">Inactive</label>
        <br><br>

        <label for="roles">Roles</label>
        <br>
        <input type="checkbox" {{in_array("ADMIN", json_decode($user->roles)) ? "checked" : ""}} name="roles[]" class="form-control {{$errors->first('roles') ? "is-invalid" : ""}}" id="ADMIN" value="ADMIN">
        <label for="ADMIN">Administrator</label>
        <input type="checkbox" {{in_array("STAFF", json_decode($user->roles)) ? "checked" : ""}} name="roles[]" id="STAFF" value="STAFF" class="form-control {{$errors->first('roles') ? "is-invalid" : ""}}">
        <label for="STAFF">Staff</label>
        <input type="checkbox" {{in_array("CUSTOMER", json_decode($user->roles)) ? "checked" : ""}} name="roles[]" id="CUSTOMER" class="form-control {{$errors->first('roles') ? "is-invalid" : ""}}" value="CUSTOMER">
        <label for="CUSTOMER">Customer</label>
        <div class="invalid-feedback">
            {{$errors->first('roles')}}
        </div>


        <br><br>
        <label for="phone">Phone Number</label>
        <br>
        <input type="text" name="phone"
            onkeypress="if ( isNaN(this.value + String.fromCharCode(event.keyCode) )) return false;" maxlength="15" class="form-control {{$errors->first('phone') ? "is-invalid" : ""}}"
            value="{{old('phone') ? old('phone') : $user->phone}}">
        <div class="invalid-feedback">
            {{$errors->first('phone')}}
        </div>

        <br>
        <label for="address">Address</label>
        <textarea name="address" id="address" class="form-control {{$errors->first('address') ? "is-invalid" : ""}}">{{old('address') ? old('address') : $user->address}}</textarea>
        <div class="invalid-feedback">
            {{$errors->first('address')}}
        </div>
        <br>

        <label for="avatar">Avatar</label>
        <br>
        Current avatar: <br>
        @if ($user->avatar)
        <img src="{{asset('storage/'.$user->avatar)}}" width="120px">
        <br>
        @else
        No avatar
        @endif
        <br>
        <input type="file" id="avatar" name="avatar" class="form-control">
        <small class="text-muted">
            Kosongkan jika tidak ingin mengubah avatar
        </small>
        <hr class="my-4">

        <label for="email">Email</label>
        <input class="form-control {{$errors->first('email') ? "is-invalid" : ""}}" placeholder="user@mail.com" type="text" name="email" id="email" value="{{$user->email}}" disabled>
        <div class="invalid-feedback">
            {{$errors->first('email')}}
        </div>
        <br>

        <input class="btn btn-primary" type="submit" value="Save">
    </form>
</div>
@endsection
