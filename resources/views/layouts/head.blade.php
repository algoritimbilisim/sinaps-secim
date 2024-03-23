<head>
    <!-- Basic Page Needs
================================================== -->
    <meta charset="utf-8" />
    <title>@yield('seo_title', setting('site.title'))</title>

    <!-- Mobile Specific Metas
================================================== -->
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="@yield('meta_description', 'CHON')" />
    <meta name="keywords" content="@yield('meta_keywords', 'CHON')">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0" />
    <meta name="author" content="Algoritim Bilişim" />
    <meta name="generator" content="Algoritim Informatics CHON HTML Template v1.0" />
    <meta name="_token" content="{{ csrf_token() }}">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" href="{{ asset('css/app.css') }}">
    <script src="{{ asset('js/app.js') }}" defer></script>

    <script src="https://cdn.jsdelivr.net/npm/echarts@5.5.0/dist/echarts.min.js"></script>

    <!-- theme meta -->
    <meta name="theme-name" content="chon" />

    <link rel="icon" type="image/svg+xml" href="{{ asset('images/CHON_fav_comp.svg') }}">

    @yield('style')

    @stack('styles')
</head>
