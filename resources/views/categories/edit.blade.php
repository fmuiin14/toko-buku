@extends('layouts.global')


@section('title')
Edit category
@endsection

@section('pageTitle')
Edit Category
@endsection

@section('content')

<div class="col-md-8">

    @if (session('status'))
    <div class="alert alert-success">
        {{session('status')}}
    </div>
    @endif


    <form enctype="multipart/form-data" class="bg-white shadow-sm p-3" action="{{route('categories.update', [$category->id])}}"
        method="POST">

        @csrf
        <input type="hidden" value="PUT" name="_method">

        <label for="category_name">Category Name</label>
        <input type="text" class="form-control {{$errors->first('name') ? "is-invalid" : ""}}" name="name" value="{{old('name') ? old('name') : $category->name}}">
        <div class="invalid-feedback">
            {{$errors->first('name')}}
        </div>
        <br><br>

        <label for="slug">Category Slug</label>
        <input type="text" class="form-control {{$errors->first('slug') ? "is-invalid" : ""}}"
            value="{{old('slug') ? old('slug') : $category->slug}}" name="slug">
            <div class="invalid-feedback">
                {{$errors->first('slug')}}
            </div>
        <br><br>

        <label for="category_image">Category Image</label><br>
        @if ($category->image)
            <span>Current Image</span><br><br>
            <img src="{{asset('storage/'.$category->image)}}" width="120"><br><br>
        @endif
        <input type="file" class="form-control" name="image">
        <small class="text-muted">Kosongkan jika tidak ingin mengubah gambar</small>

        <br><br>

        <input type="submit" class="btn btn-primary" value="Update">

    </form>
</div>

@endsection
