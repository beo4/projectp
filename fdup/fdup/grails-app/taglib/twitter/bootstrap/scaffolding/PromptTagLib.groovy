package twitter.bootstrap.scaffolding

class PromptTagLib {

	static namespace = "bootstrap"



	def prompt = {
		attrs ->
		if (!attrs.name) throwTagError("Tag [prompt] is missing required attribute [name]")
		if (!attrs.createId) throwTagError("Tag [prompt] is missing required attribute [createId]")
		
		// actually imports '/app/js/bootbox.js'
		out << g.javascript(src:"bootbox.js")

		def name = attrs.name
		def id = attrs.createId
		attrs.url.id = id
		
		attrs.onSuccess=name + "bootbox(data)"
		attrs.onFailure =name + "bootbox(data)"
		attrs.method = 'GET'
		

		out << g.formRemote(attrs){
					out << '<div class="form-actions">'
					out << '<button type="submit" class="btn btn-primary bs-prompt">'
					out << '	<i class="icon-plus-sign icon-white"></i>'
					out << g.message(code: name+".button.create.label", default:"Create " + name )
					out << '</button>'
					out << '</div>'
					
				}
		out << g.javascript(){
			'function ' + name + 'bootbox(e) {'+
			'bootbox.dialog(e, [{'+
                   ' "label" : "Success!",'+
                   ' "class" : "btn-success",'+
                   ' "callback": function() {'+
                    '    console.log("Create '+name+' with ID: " + '+id+');'+
					'	 jQuery(\'#'+ name +id+'\').submit();'+
                    '}'+
                '}'+
			'])}'
		}

		

	}
}
