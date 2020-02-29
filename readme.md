laravel<br/>
php artisan serve
npm run hot 因为配置了mix-manifest路径(用来区分前后端多入口)，所以不支支持laravel hot热更新，生成的文件路径会乱
npm run wath 因为配置了mix-manifest路径(用来区分前后端多入口)，需要安装browserSync插件支持浏览器自动刷新
npm run dev 打包前端资源   
npm run dev-admin 打包后端资源  
browserSync 可以同时运行前端和后端两个入口文件，但是端口不一样 http://localhost:3000/ 只对前端生效，  http://localhost:3002/：只对后端生效