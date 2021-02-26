package why.email;

using StringTools;

@:forward
abstract Address(AddressBase) from AddressBase to AddressBase {
	
	// TODO: validate email address
	// static var REGEX = ~/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	
	@:from
	public static function parse(v:String):Address {
		var re = ~/^(.*)\s?<(.*)>$/;
		return if(re.match(v)) {
			var name = re.matched(1).trim();
			if(name.charCodeAt(0) == '"'.code && name.charCodeAt(name.length - 1) == '"'.code)
				name = name.substr(1, name.length - 2);
			{name: name, address: re.matched(2)}
		} else {
			{address: v}
		}
	}
	
	@:to
	public function toString():String {
		return if(this.name == null) this.address else '"${this.name}" <${this.address}>';
	}
}

@:forward
abstract AddressList(Array<Address>) from Array<Address> to Array<Address> {
	public inline function isEmpty() {
		return this == null || this.length == 0;
	}
	
	@:from
	public static inline function fromStringArray(arr:Array<String>):AddressList {
		return [for(v in arr) (v:Address)];
	}
}

private typedef AddressBase = {
	@:optional var name(default, never):String;
	var address(default, never):String;
}