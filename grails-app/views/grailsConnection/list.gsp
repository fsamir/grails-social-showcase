
<%@ page import="grails.social.showcase.GrailsConnection" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'grailsConnection.label', default: 'GrailsConnection')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'grailsConnection.id.label', default: 'Id')}" />

                            <g:sortableColumn property="providerId" title="${message(code: 'grailsConnection.providerId.label', default: 'Provider Id')}" />

                            <th><g:message code="grailsConnection.account.label" default="Account" /></th>
                        
                            <g:sortableColumn property="secret" title="${message(code: 'grailsConnection.secret.label', default: 'Secret')}" />
                        
                            <g:sortableColumn property="refreshToken" title="${message(code: 'grailsConnection.refreshToken.label', default: 'Refresh Token')}" />
                        
                            <g:sortableColumn property="providerAccountId" title="${message(code: 'grailsConnection.providerAccountId.label', default: 'Provider Account Id')}" />
                        
                            <g:sortableColumn property="accessToken" title="${message(code: 'grailsConnection.accessToken.label', default: 'Access Token')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${grailsConnectionInstanceList}" status="i" var="grailsConnectionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${grailsConnectionInstance.id}">${fieldValue(bean: grailsConnectionInstance, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: grailsConnectionInstance, field: "providerId")}</td>

                            <td>${fieldValue(bean: grailsConnectionInstance, field: "account")}</td>
                        
                            <td>${fieldValue(bean: grailsConnectionInstance, field: "secret")}</td>
                        
                            <td>${fieldValue(bean: grailsConnectionInstance, field: "refreshToken")}</td>
                        
                            <td>${fieldValue(bean: grailsConnectionInstance, field: "providerAccountId")}</td>
                        
                            <td>${fieldValue(bean: grailsConnectionInstance, field: "accessToken")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${grailsConnectionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
