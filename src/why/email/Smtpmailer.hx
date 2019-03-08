package why.email;

#if !smtpmailer
	#error "Requires the smtpmailer Haxe library"
#end

import why.Email;
import smtpmailer.SmtpMailer as Impl;

using haxe.io.Path;
using tink.CoreApi;

/**
 * Requires the `smtpmailer` haxe library
 * https://github.com/benmerckx/smtpmailer
 */
class Smtpmailer implements Email {
	
	var mailer:Impl;
	
	public function new(config) {
		mailer = new Impl(config);
	}
	
	public function send(config:EmailConfig):Promise<Noise> {
		return mailer.send({
			from: {address: config.from.address, displayName: config.from.name},
			to: [for(to in config.to) to.address],
			subject: config.subject,
			content: {
				text: config.content.text,
				html: config.content.html,
			},
			attachments: [], // TODO
		}).map(function(o) return switch o {
			case Success(_): Success(Noise);
			case Failure(e): trace(e); Failure(Error.withData('Smtp Error', e));
		});
	}
}
