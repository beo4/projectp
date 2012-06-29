package twitter.bootstrap.scaffolding

class PromptTagLib {

	static namespace = "bootstrap"



	def prompt = {
		attrs ->
		// actually imports '/app/js/bootbox.js'
		out << g.javascript(src:"bootbox.js")

		def name = attrs.name
		def map
		
		attrs.onSuccess=name + "bootbox(data)"
		attrs.onFailure =name + "bootbox(data)"
		attrs.method = 'GET'
		

		out << g.formRemote(attrs){
					out << '<div class="form-actions">'
					out << '<button type="submit" class="btn btn-primary bs-prompt">'
					out << '	<i class="icon-add icon-white"></i>'
					out << g.message(code:"default.button.create.label", default:"Create" )
					out << '</button>'
					out << '</div>'
					
				}
		out << g.javascript(){
			'function ' + name + 'bootbox(e) {'+
			'bootbox.alert(e){'+
			'[{ '+
                   ' "label" : "Success!",'+
                   ' "class" : "btn-success",'+
                   ' "callback": function() {'+
                    '    console.log("great success");'+
                    '}'+
                '}'+
			']}}'
		}

		

	}
}
