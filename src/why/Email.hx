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