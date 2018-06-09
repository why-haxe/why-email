package why.email;

@:forward
abstract Address(Base) from Base to Base {
	@:from
	public static function parse(v:String):Address {
		throw 'TODO';
	}
}

private typedef Base = {
	var name(default, never):String;
	var address(default, never):String;
}