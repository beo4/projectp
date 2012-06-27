import de.ospu.fdup.security.SecRole
import de.ospu.fdup.security.SecUser
import de.ospu.fdup.security.SecUserSecRole
import de.ospu.fdup.testimonial.Area;
import de.ospu.fdup.testimonial.Question;

class BootStrap {

    def init = { servletContext ->

      def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true) 
      def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)
		
      def adminUser = SecUser.findByUsername('admin') ?: new SecUser( username: 'admin', password: springSecurityService.encodePassword('admin'), enabled: true).save(failOnError: true)
	  if (!adminUser.authorities.contains(adminRole)) { SecUserSecRole.create adminUser, adminRole } 
		
	  
	  
	  
	  
   }

    def destroy = {
    }
}
