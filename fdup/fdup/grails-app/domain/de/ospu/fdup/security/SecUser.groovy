package de.ospu.fdup.security

import de.ospu.fdup.examinee.Examinee

class SecUser {

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	Examinee examinee

	static constraints = {
		username blank: false, unique: true
		password blank: false
		examinee display: false, blank: true, nullable: true
	}

	static mapping = {
		password column: '`password`'
	}

	static belongsTo =  Examinee

	Set<SecRole> getAuthorities() {
		SecUserSecRole.findAllBySecUser(this).collect { it.secRole } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
