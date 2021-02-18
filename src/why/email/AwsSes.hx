package why.email;

import why.Email;
import #if haxe4 js.lib.Error #else js.Error #end as JsError;
import #if haxe4 js.lib.Promise #else js.Promise #end as JsPromise;

using tink.CoreApi;

/**
 * AWS SES
 * Requires the `aws-sdk` node module
 */
class AwsSes extends EmailBase {
	var ses:SES;
	
	public function new(?config) {
		ses = new SES(config);
	}
	
	function doSend(config:EmailConfig):Promise<Noise> {
		return Promise.ofJsPromise(ses.sendEmail({
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
		}).promise());
	}
}


@:jsRequire('aws-sdk', 'SES')
private extern class SES {
	function new(?opt:{});
	function sendEmail(opt:{}):Request<Dynamic>;
}

private extern class Request<T> {
	function promise():JsPromise<T>;
}