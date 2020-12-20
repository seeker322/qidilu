<!doctype html>

<html lang="{{ app()->getLocale() }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="userinfo" content="{{ json_encode($userInfo) }}">
    <title>后台管理</title>

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Raleway:100,600" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="{{ mix('css/app.css','back') }}">

    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>

</head>
<body>
<div id="app">
    <router-view></router-view>
</div>
</body>

<script src="{{mix('js/app.js', 'back')}}"></script>
</html>
