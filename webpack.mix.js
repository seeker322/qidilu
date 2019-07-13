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
const { env } = require('minimist')(process.argv.slice(2));

if (env && env.admin) {
    require(`${__dirname}\\webpack.admin.js`);

    return;
}

// 前台项目的构建规则
if (mix.inProduction()) {
    mix.version()
}
mix.webpackConfig({
    output: {
        publicPath: '/frontend/', // 设置默认打包目录
        chunkFilename: `js/[name].${mix.inProduction() ? '[chunkhash].' : ''}js` // 路由懒加载的时候打包出来的js文件
    }
})

mix.js('resources/assets/js/home/app.js', 'public/frontend/js')
    .sass('resources/assets/sass/home/app.scss', 'public/frontend/css')
    .setResourceRoot('/frontend/') // 设置资源目录
    .setPublicPath('public/frontend/') // 设置 mix-manifest.json 目录
// browserSync