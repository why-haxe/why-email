package;

import why.Email;
import why.email.Address;

@:asserts
class AddressTest {
	public function new() {}
	
	@:variant('"Foo" <foo@bar.com>', 'Foo', 'foo@bar.com')
	@:variant('"Foo Bar" <foo@bar.com>', 'Foo Bar', 'foo@bar.com')
	@:variant('"Foo"<foo@bar.com>', 'Foo', 'foo@bar.com')
	@:variant('"Foo Bar"<foo@bar.com>', 'Foo Bar', 'foo@bar.com')
	@:variant('Foo <foo@bar.com>', 'Foo', 'foo@bar.com')
	@:variant('Foo Bar <foo@bar.com>', 'Foo Bar', 'foo@bar.com')
	@:variant('Foo<foo@bar.com>', 'Foo', 'foo@bar.com')
	@:variant('Foo Bar<foo@bar.com>', 'Foo Bar', 'foo@bar.com')
	@:variant('foo@bar.com', null, 'foo@bar.com')
	public function parse(input:String, name:String, address:String) {
		var parsed:Address = input;
		asserts.assert(parsed.name == name);
		asserts.assert(parsed.address == address);
		return asserts.done();
	}
}