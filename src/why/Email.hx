package why;

import why.email.Address;
import why.email.Attachment;
import why.email.Content;

using tink.CoreApi;

interface Email {
	function send(config:EmailConfig):Promise<Noise>;
}

typedef EmailConfig = {
	from:Address,
	to:AddressList,
	?cc:AddressList,
	?bcc:AddressList,
	subject:String,
	content:Content,
	?attachments:Array<Attachment>
}