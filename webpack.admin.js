let mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

// mix.setPublicPath('public-admin');
// mix.setPublicPath('public/admin/')




mix.webpackConfig({
    output : {
        publicPath : '/back/',
        chunkFilename : `js/[name].${mix.inProduction() ? '[chunkhash].' : ''}js`
    }
})

mix.js('resources/assets/js/admin/app.js', 'public/back/js')
   .sass('resources/assets/sass/admin/app.scss', 'public/back/css')
    .setResourceRoot('/back/') // 设置资源目录
    .setPublicPath('public/back')
