import 'package:flutter_peertuber/src/features/common/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('field validations', () {
    group('password validation', () {
      test('should have a valid password', () {
        // arrange
        const Password pass1 = Password.dirty("mypassword");
        const Password pass2 = Password.dirty("MyP@ssWord05!");
        const Password pass3 = Password.dirty("mY_PAss W!ord");

        // assert
        expect(pass1.isValid, true);
        expect(pass2.isValid, true);
        expect(pass3.isValid, true);
      });

      test('should be a minmum of 6 characters', () {
        // arrange
        const Email shortPass = Email.dirty("pass");

        // assert
        expect(shortPass.isNotValid, true);
      });
    });
    group('email validation', () {
      test('should have a valid email', () {
        // arrange
        const Email email1 = Email.dirty("myemail@domain.com");
        const Email email2 = Email.dirty("my_email@mail.domain.com");
        const Email email3 = Email.dirty("my.email@mail-domain.com");

        // assert
        expect(email1.isValid, true);
        expect(email2.isValid, true);
        expect(email3.isValid, true);
      });

      test('should be an invalid email', () {
        // arrange
        const Email email1 = Email.dirty("myemail");
        const Email email2 = Email.dirty("my!email@mail.domain.com");
        const Email email3 = Email.dirty("my.email@mail_domain");

        // assert
        expect(email1.isValid, false);
        expect(email2.isValid, false);
        expect(email3.isValid, false);
      });
    });
    group('username validation', () {
      test('should have a valid username', () {
        // arrange
        const Username username = Username.dirty("myusername");

        // assert
        expect(username.isValid, true);
      });

      test('should allow underscores and periods', () {
        // arrange
        const Username username1 = Username.dirty("my.username");
        const Username username2 = Username.dirty("my_username");

        // assert
        expect(username1.isValid, true);
        expect(username2.isValid, true);
      });

      test('should not allow uppercase characters', () {
        // arrange
        const Username username = Username.dirty("Myusername");

        // assert
        expect(username.isValid, false);
      });

      test(
          'should not allow special characters that aren\'t underscore or period',
          () {
        // arrange
        const Username username = Username.dirty("my!username");

        // assert
        expect(username.isValid, false);
      });
    });
  });
}
