package why.email;

typedef Attachment = {
	filename:String,
	source:AttachmentSource,
}

enum AttachmentSource {
	Local(path:String);
}