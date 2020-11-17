@extends('layouts.global')

@section('title')
Users List
@endsection

@section('content')

<table class="table table-bordered">
    <thead>
        <tr>
            <th><b>Name</b></th>
            <th><b>Username</b></th>
            <th><b>Email</b></th>
            <th><b>Avatar</b></th>
            <th><b>Action</b></th>
        </tr>
    </thead>
    <tbody>
        @foreach ($users as $user)
        <tr>
            <td>{{$user->name}}</td>

            <td>{{$user->username}}</td>
            <td>{{$user->email}}</td>
            <td>
                @if ($user->avatar)
                <img src="{{asset('storage/'.$user->avatar)}}" width="70px">
                @else
                N/A
                @endif
            </td>
            <td>
                <a href="{{route('users.edit', [$user->id])}}" class="btn btn-info text-white btn-sm">Edit</a>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
@endsection
