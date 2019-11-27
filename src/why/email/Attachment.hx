package why.email;

using tink.io.Source;

typedef Attachment = {
	filename:String,
	source:AttachmentSource,
}

enum AttachmentSource {
	Local(path:String);
	Stream(source:RealSource);
}
