package grails.social.showcase

import org.apache.commons.lang.builder.HashCodeBuilder

class AccountRole implements Serializable {

	Account account
	Role role

	boolean equals(other) {
		if (!(other instanceof AccountRole)) {
			return false
		}

		other.account?.id == account?.id &&
			other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (account) builder.append(account.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static AccountRole get(long accountId, long roleId) {
		find 'from AccountRole where account.id=:accountId and role.id=:roleId',
			[accountId: accountId, roleId: roleId]
	}

	static AccountRole create(Account account, Role role, boolean flush = false) {
		new AccountRole(account: account, role: role).save(flush: flush, insert: true)
	}

	static boolean remove(Account account, Role role, boolean flush = false) {
		AccountRole instance = AccountRole.findByAccountAndRole(account, role)
		instance ? instance.delete(flush: flush) : false
	}

	static void removeAll(Account account) {
		executeUpdate 'DELETE FROM AccountRole WHERE account=:account', [account: account]
	}

	static void removeAll(Role role) {
		executeUpdate 'DELETE FROM AccountRole WHERE role=:role', [role: role]
	}

	static mapping = {
		id composite: ['role', 'account']
		version false
	}
}
