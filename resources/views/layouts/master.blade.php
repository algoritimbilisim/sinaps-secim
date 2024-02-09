<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}">

@include('layouts.head')

@include('layouts.header')

@yield('style')

@stack('styles')

@yield('content')

@yield('scripts')

@stack('scripts')

@include('layouts.footer')

</html>
