<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="main" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #logo {
            margin-left:19px;
        }
        #pageBody {
            margin-left:40px;
            margin-right:20px;
        }
        </style>
    </head>
    <body>

        <div id="pageBody">
            <h1>Grails Social Showcase</h1>
            <p>&nbsp;</p>
            <p>
                This project is aimed to provide an sample Grails application using Spring-social-showcase, to integrate your application login to
                Facebook/Twitter/etc logins with oAuth/xAuth.
                <br>
                With this sample is also possible to execute operations in these social networks, such as posting to the timeline, loading lists of friends, etc.
               </p>
            <p>
                <b>How to start:</b> Create an account (or use an existing one) and connect it to Facebook, twitter an TripIt.
            </p>
            <p>
                <ul>
                <li class="controller">1. <g:link controller="login">Create account/Login</g:link></li>
                <li class="controller">2. <g:link controller="facebook">Connect to Facebook</g:link></li>
                <li class="controller">3. <g:link controller="twitter">Connect to Twitter</g:link></li>
                <li class="controller">4. <g:link controller="tripit">Connect to TripIt</g:link></li>
            </ul>
            </p>

            <div id="controllerList" class="dialog">
                <h2>Other available Controllers:</h2>
                <ul>
                    <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
                        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
                    </g:each>
                </ul>
            </div>
        </div>
    </body>
</html>
