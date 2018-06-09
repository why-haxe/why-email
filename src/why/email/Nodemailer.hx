package why.email;

import why.Email;

using haxe.io.Path;
using tink.CoreApi;

class Nodemailer implements Email {
	
	var transporter:Transporter;
	
	public function new(config:TransporterConfig) {
		transporter = NativeNodemailer.createTransport(config);
	}
	
	public function send(config:EmailConfig):Promise<Noise> {
		return Promise.ofJsPromise(transporter.sendMail({
			from: config.from,
			to: config.to,
			cc: config.cc,
			bcc: config.bcc,
			subject: config.subject,
			text: config.content.text,
			html: config.content.html,
			attachments: {
				var attachments = [];
				for(attachment in config.attachments)
					switch attachment.source {
						case Local(path): attachments.push({filename: attachment.filename, path: path});
					}
				attachments;
			},
		})).noise();
	}
}


@:jsRequire('nodemailer')
extern class NativeNodemailer {
    static function createTransport(opts:TransporterConfig):Transporter;
}

extern class Transporter {
    function sendMail(opts:Dynamic):js.Promise<{}>;
}

typedef TransporterConfig = {
	host:String,
	port:Int,
	secure:Bool,
	auth:{
		user:String,
		pass:String,
	},
}