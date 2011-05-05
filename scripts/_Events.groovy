
import grails.util.Environment
 
eventWebXmlEnd = { String filename ->
 
   if (Environment.current != Environment.DEVELOPMENT) {
      return
   }
 
   String consoleServlet = '''
 
   <servlet>
      <servlet-name>H2Console</servlet-name>
      <servlet-class>org.h2.server.web.WebServlet</servlet-class>
      <load-on-startup>1</load-on-startup>
      <init-param>
         <param-name>-webAllowOthers</param-name>
         <param-value>true</param-value>
      </init-param>
   </servlet>'''
 
   String consoleServletMapping = '''
 
   <servlet-mapping>
      <servlet-name>H2Console</servlet-name>
      <url-pattern>/dbconsole/*</url-pattern>
   </servlet-mapping>'''
 
   def insertAfterTag = { String original, String endTag, String addition ->
      int index = original.indexOf(endTag)
      original.substring(0, index + endTag.length()) +
            addition + original.substring(index + endTag.length())
   }
 
   String xml = webXmlFile.text
   xml = insertAfterTag(xml, '</servlet>', consoleServlet)
   xml = insertAfterTag(xml, '</servlet-mapping>', consoleServletMapping)
 
   webXmlFile.withWriter { it.write xml }
}
