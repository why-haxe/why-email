package why;

import why.email.*;

using tink.CoreApi;

interface Email {
	function send(config:EmailConfig):Promise<Noise>;
}

typedef EmailConfig = {
	from:Address,
	to:Array<Address>,
	?cc:Array<Address>,
	?bcc:Array<Address>,
	subject:String,
	content:Content,
	attachments:Array<Attachment>
}

@:forward
abstract Address(AddressBase) from AddressBase to AddressBase {
	@:from
	public static function parse(v:String):Address {
		throw 'TODO';
	}
	
	@:to
	public function toString():String {
		return if(this.name == null) this.address else '"${this.name}" <${this.address}>';
	}
}

private typedef AddressBase = {
	@:optional var name(default, never):String;
	var address(default, never):String;
}

@:forward
abstract Content(ContentBase) from ContentBase to ContentBase {
	
}

private typedef ContentBase = {
	var text(default, never):String;
	var html(default, never):String;
}

typedef Attachment = {
	filename:String,
	source:AttachmentSource,
}

enum AttachmentSource {
	Local(path:String);
}
