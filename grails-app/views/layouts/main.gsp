<!DOCTYPE html>
<html>
<head>
    <title><g:layoutTitle default="Grails Social Showcase"/></title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"/>
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
    <g:layoutHead/>
    <g:javascript library="application"/>
    <g:javascript library="jquery" plugin="jquery"/>
</head>
<body>
<div id="spinner" class="spinner" style="display:none;">
    <img src="${resource(dir: 'images', file: 'spinner.gif')}" alt="${message(code: 'spinner.alt', default: 'Loading...')}"/>
</div>
<div id="logo">
    <a href="http://11folders.com">
        <img src="${resource(dir: 'images', file: '11folders.png')}" alt="Eleven Folders Technology" border="0"/></a></div>
<g:layoutBody/>
<div id="footer">
    <p><b>Grails Social Showcase</b></p>
    <p>
        <a href="https://github.com/SpringSource/spring-social-samples" target="_new">Port from Spring Social Showcase ::</a>
        <br>

        Proudly sponsored by <a href="http://11folders.com" target=_new">Eleven Folders Technology<a/>
        <br>
        Author: <A href="http://dattein.com/blog/grails-social-showcase/" target="_new">Franklin Dattein</A>
    </p>
</div>
</body>
</html>