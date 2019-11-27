package why.email;

@:forward
abstract Content(ContentBase) from ContentBase to ContentBase {
	
}

private typedef ContentBase = {
	var text(default, never):String;
	var html(default, never):String;
}