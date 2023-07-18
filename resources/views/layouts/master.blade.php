@include('layouts.head')

@include('layouts.header')

@yield('style')

@stack('styles')

@yield('content')

@yield('script')

@stack('scripts')

@include('layouts.footer')
