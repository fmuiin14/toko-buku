@extends('layouts.global')

@section('title')
    Create Book
@endsection

@section('content')


<div class="row">
    <div class="col-md-8">
        
        @if (session('status'))
            <div class="alert alert-success">
                {{session('status')}}
            </div>
        @endif
        
        <form action="{{route('books.store')}}" method="POST" enctype="multipart/form-data" class="shadow-sm p-3 bg-white">
        
            @csrf

            <label for="title">Title</label><br>
            <input type="text" class="form-control" name="title" placeholder="Book title">
            <br>

            <label for="cover">Cover</label>
            <input type="file" class="form-control" name="cover">
            <br>

            <label for="description">Description</label> <br>
            <textarea name="description" id="description" class="form-control" placeholder="Give a description about this book"></textarea><br>

            <label for="stock">Stock</label> <br>
            <input type="number" class="form-control" id="stock" name="stock" min="0" value="0">
            <br>

            <label for="author">Author</label> <br>
            <input type="text" class="form-control" name="author" id="author" placeholder="book author"> <br>

            <label for="publisher">Publisher</label> <br>
            <input type="text" class="form-control" id="publisher" name="publisher" placeholder="book publisher"> <br>

            <label for="price">Price</label> <br>
            <input type="number" class="form-control" name="price" id="price" placeholder="Book price"> <br>

            <button class="btn btn-primary" name="save_action" value="PUBLISH">Publish</button>

            <button class="btn btn-secondary" name="save_action" value="DRAFT">Save as draft</button>
        </form>
    </div>
</div>

@endsection