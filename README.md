# Why Email

Abstraction of various email services.

## Interface

```haxe
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
	?attachments:Array<Attachment>
}
```

## Usage

Pick one implementation from the `why.email` package or roll your own.