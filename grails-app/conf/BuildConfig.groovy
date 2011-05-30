grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
//grails.project.war.file = "target/${appName}-${appVersion}.war"
grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
        // uncomment to disable ehcache
        // excludes 'ehcache'
    }
    log "warn" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    repositories {
        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenCentral()
    }

    dependencies {
        runtime('com.h2database:h2:1.3.146', transitive=false
//                'org.springframework.social:spring-social-core:1.0.0.M2',
//                'org.springframework.social:spring-social-twitter:1.0.0.M2',
//                'org.springframework.social:spring-social-facebook:1.0.0.M2',
//                'org.springframework.social:spring-social-tripit:1.0.0.M2'
        )

        compile 'org.codehaus.jackson:jackson-mapper-asl:1.7.3'

    }
}
