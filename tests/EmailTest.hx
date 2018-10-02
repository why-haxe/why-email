package;

import why.Email;

@:asserts
class EmailTest {
	
	var email:Email;
	
	public function new(email) {
		this.email = email;
	}
	
	public function send() {
		email.send({
			from: {name: 'John Doe', address: 'john@example.com'},
			to: [{name: 'Chris Wong', address: 'chris@example.com'}],
			subject: 'Test Subject',
			content: {
				text: 'Test Plain Text Content',
				html: '<p>Test Html Content</p>',
			},
			attachments: [], // TODO
		}).handle(function(sent) {
			asserts.assert(sent);
			asserts.done();
		});
		
		return asserts;
	}
}