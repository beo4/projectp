package de.ospu.fdup.examinee

import de.ospu.fdup.security.SecUser
import de.ospu.fdup.testimonial.Questionnaire;

class Examinee {

    static constraints = {
		email(email: true)
		userAccount(display: false)
    }
	
	String realname
	String surname
	String zipcode
	String email
	
	SecUser userAccount
	
	@Override
	public String toString() {
		return surname + ' ' + realname;
	}
	
	static hasMany = [questionnaires:Questionnaire]
	
	
	public Questionnaire getActualQuestionnaire() {
		return Questionnaire.findWhere(examinee: this, active: true)
	}
}
