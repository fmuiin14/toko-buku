@extends('layouts.global')

@section('title')
Home Toko Buku
@endsection

@section('pageTitle')
Home
@endsection

@section('content')
<div class="container">
    <!-- start info box -->
    <div class="row ">
        <div class="col-md-12 pl-3 pt-2">
            <div class="row pl-3">

                <div class="col-md-6 col-lg-3 col-12 mb-2 col-sm-6">
                    <div class="media shadow-sm p-0 bg-white rounded text-primary ">
                        <span class="oi top-0 rounded-left bg-primary text-light h-100 p-4 oi-badge fs-5"></span>
                        <div class="media-body p-2">
                            <h6 class="media-title m-0">TOTAL USERS</h6>
                            <div class="media-text">
                                <h3>{{$users}}</h3>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 col-12 mb-2 col-sm-6">
                    <div class="media shadow-sm p-0 bg-success-lighter text-light rounded">
                        <span class="oi top-0 rounded-left bg-white text-success h-100 p-4 oi-people fs-5"></span>
                        <div class="media-body p-2">
                            <h6 class="media-title m-0">CATEGORIES</h6>
                            <div class="media-text">
                                <h3>{{$categories}}</h3>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 col-12 mb-2 col-sm-6">
                    <div class="media shadow-sm p-0 bg-warning-lighter text-primary-darker rounded ">
                        <span class="oi top-0 rounded-left bg-white text-warning h-100 p-4 oi-cart fs-5"></span>
                        <div class="media-body p-2">
                            <h6 class="media-title m-0">TOTAL BUKU</h6>
                            <div class="media-text">
                                <h3>{{$books}}</h3>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 col-12 mb-2 col-sm-6">
                    <div class="media shadow-sm p-0 bg-info-lighter text-light rounded ">
                        <span class="oi top-0 rounded-left bg-white text-info h-100 p-4 oi-tag fs-5"></span>
                        <div class="media-body p-2">
                            <h6 class="media-title m-0">TOTAL ORDERS</h6>
                            <div class="media-text">
                                <h3>{{$orders}}</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end info box -->
</div>
@endsection
