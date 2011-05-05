

<%@ page import="grails.social.showcase.GrailsConnection" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'grailsConnection.label', default: 'GrailsConnection')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${grailsConnectionInstance}">
            <div class="errors">
                <g:renderErrors bean="${grailsConnectionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="account"><g:message code="grailsConnection.account.label" default="Account" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: grailsConnectionInstance, field: 'account', 'errors')}">
                                    <g:select name="account.id" from="${grails.social.showcase.Account.list()}" optionKey="id" value="${grailsConnectionInstance?.account?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="secret"><g:message code="grailsConnection.secret.label" default="Secret" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: grailsConnectionInstance, field: 'secret', 'errors')}">
                                    <g:textField name="secret" value="${grailsConnectionInstance?.secret}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="refreshToken"><g:message code="grailsConnection.refreshToken.label" default="Refresh Token" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: grailsConnectionInstance, field: 'refreshToken', 'errors')}">
                                    <g:textField name="refreshToken" value="${grailsConnectionInstance?.refreshToken}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="providerAccountId"><g:message code="grailsConnection.providerAccountId.label" default="Provider Account Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: grailsConnectionInstance, field: 'providerAccountId', 'errors')}">
                                    <g:textField name="providerAccountId" value="${grailsConnectionInstance?.providerAccountId}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="accessToken"><g:message code="grailsConnection.accessToken.label" default="Access Token" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: grailsConnectionInstance, field: 'accessToken', 'errors')}">
                                    <g:textField name="accessToken" value="${grailsConnectionInstance?.accessToken}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="providerId"><g:message code="grailsConnection.providerId.label" default="Provider Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: grailsConnectionInstance, field: 'providerId', 'errors')}">
                                    <g:textField name="providerId" value="${grailsConnectionInstance?.providerId}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
