def log = org.apache.log4j.Logger.getLogger('scaffolding.resources')
def dev = grails.util.GrailsUtil.isDevelopmentEnv()

def cssFile = "bootstrap.css"
def cssminFile = "bootstrap.min.css"

modules = {
	scaffolding {
		dependsOn 'bootstrap'
		resource url: 'css/scaffolding.css'
		resource url: 'css/scaffoldingPrint.css', attrs:[media: 'print']
		resource url:[plugin: 'twitter-bootstrap', dir: 'css', file: (dev ? cssFile : cssminFile)], disposition: 'head', exclude:'minify', attrs:[media: 'print']
	}
	
	
}