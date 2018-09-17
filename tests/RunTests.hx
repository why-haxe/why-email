package;

import tink.unit.*;
import tink.testrunner.*;
import why.email.*;

class RunTests {

  static function main() {
    AwsSes;
    Runner.run(TestBatch.make([
      new EmailTest(new Nodemailer({
        host: 'localhost',
        port: 1025
      })),
      // new EmailTest(new Smtpmailer({
      //   host: 'localhost',
      //   port: 1025
      // })),
    ])).handle(Runner.exit);
  }
  
}