package why.email;

import js.aws.ses.SES;
import why.Email;

using tink.CoreApi;

@:build(futurize.Futurize.build())
@:require('extern-js-aws-sdk')
@:require('futurize')
class AwsSes implements Email {
	var ses:SES;
	
	public function new(?config) {
		ses = new SES(config);
	}
	
	public function send(config:EmailConfig):Promise<Noise> {
		return @:futurize ses.sendEmail({
			Source: config.from.toString(),
			Destination: {
				ToAddresses: config.to == null ? null : [for(a in config.to) a.toString()],
				BccAddresses: config.bcc == null ? null : [for(a in config.bcc) a.toString()],
				CcAddresses: config.cc == null ? null : [for(a in config.cc) a.toString()],
			},
			Message: {
				Subject: {
					Data: config.subject,
				},
				Body: {
					Html: {
						Data: config.content.html,
					},
					Text: {
						Data: config.content.text,
					},
				}
			},
		}, $cb1);
	}
}