@extends('layouts.master')

@section('content')

    <body id="top" class="{{ setting('site.theme') }}">
        <main>
            <x-docs />
            <h1>İçeriği buraya ekleyerek başlayabilirsiniz.</h1>

        </main>
        @stack('styles')
        @stack('scripts')

    </body>
@endsection
