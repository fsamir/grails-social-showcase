package grails.social.showcase


class Account {

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
	}

	static mapping = {
		password column: '`password`'
	}

	Set<Role> getAuthorities() {
		AccountRole.findAllByAccount(this).collect { it.role } as Set
	}

    String toString() {
      return "Account($username)"
    }
}
