@extends('layouts.global')


@section('title')
Detail User
@endsection

@section('content')
<div class="col-md-8">
    <div class="card">
        <div class="card-body">
            <b>Name</b><br>
            {{$users->name}}
            <br><br>
            @if ($users->avatar)
            <img src="{{asset('storage/'. $users->avatar)}}" width="128px" alt="">
            @else No avatar
            @endif
            <br><br>
            <b>Username:</b><br>
            {{$users->email}}
            <br><br>
            <b>Phone number</b><br>
            {{$users->phone}}
            <br><br>
            <b>Address</b><br>
            {{$users->address}}
            <br><br>
            <b>Roles:</b><br>
            @foreach (json_decode($users->roles) as $role)
            &middot; {{$role}} <br>
            @endforeach
        </div>
    </div>
</div>
@endsection
