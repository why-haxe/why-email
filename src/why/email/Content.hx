package why.email;

@:forward
abstract Content(Base) from Base to Base {
	
}

private typedef Base = {
	var text(default, never):String;
	var html(default, never):String;
}