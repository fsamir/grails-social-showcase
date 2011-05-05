<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails Social Showcase by Foldders.com" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
        <g:javascript library="jquery" plugin="jquery"/>
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="grailsLogo"><a href="http://grails.org"><img src="${resource(dir:'images',file:'grails_logo.png')}" alt="Grails" border="0" /></a></div>
        <g:layoutBody />
    <div id="footer">
        <p>Grails Social Showcase</p>
        <p>
            <a href="https://github.com/SpringSource/spring-social-samples" target="_new">Port from Spring Social Showcase</a> by <a href="http://foldders.com" target=_new">Foldders Technology<a/></p>

    </div>


    </body>
</html>