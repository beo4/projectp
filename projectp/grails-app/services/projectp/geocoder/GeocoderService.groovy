package projectp.geocoder

import groovy.json.JsonSlurper

class GeocoderService {
	boolean transactional = false
	static scope = "singleton"
	
    def queryForXML(String query) {
        def config = ConfigurationHolder.config
        String configUrlXML = config.googleapi.url.xml
        
        def urlXML = new URL(configUrlXML + removeSpaces(query))
        def geoCodeResultXML = new XmlParser().parseText(urlXML.getText())
        def xmlMap = [:]
        xmlMap.query = query
        xmlMap.lat = geoCodeResultXML.result.geometry.location.lat.text()
        xmlMap.lng = geoCodeResultXML.result.geometry.location.lng.text()
        xmlMap.address = geoCodeResultXML.result.formatted_address.text()
        
        return xmlMap
    }
    
    def queryForJSON(String query) {
        def config = ConfigurationHolder.config
        String configUrlJSON = config.googleapi.url.json
        
        def urlJSON = new URL(configUrlJSON + removeSpaces(query))
        def geoCodeResultJSON = new JsonSlurper().parseText(urlJSON.getText())
        def jsonMap = [:]
        jsonMap.query = query
        jsonMap.lat = geoCodeResultJSON.results.geometry.location.lat[0]
        jsonMap.lng = geoCodeResultJSON.results.geometry.location.lng[0]
        jsonMap.address = geoCodeResultJSON.results.formatted_address[0]
        
        return jsonMap
    }

    private String removeSpaces(String query) {
        query.replaceAll(" ", "+")
    }
}
