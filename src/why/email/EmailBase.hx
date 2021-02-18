package why.email;

import why.Email;

using tink.CoreApi;

abstract class EmailBase implements Email {
	public final function send(config:EmailConfig):Promise<Noise> {
		return 
			if(config.to.isEmpty() && config.bcc.isEmpty() && config.cc.isEmpty()) 
				Promise.NOISE;
			else
				doSend(config);
	}
	
	abstract function doSend(config:EmailConfig):Promise<Noise>;
}