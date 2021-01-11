// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login Test', () {
    final mailInput = find.byValueKey('mail-input');
    final wrongPassWindow = find.byValueKey('wrong-password');
    final okButton = find.byValueKey('wrong-password-ok');
    final passInput = find.byValueKey('pass-input');
    final button = find.byValueKey('signInButton');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect(logCommunicationToFile: false);
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        //driver.close();
      }
    });

    test('Enters wrong credentials', () async {
      await driver.tap(mailInput);
      await driver.enterText('fabijanicmarin6@gmail.com');
      await driver.waitFor(mailInput);
      //await driver.tap(button);

      expect(await driver.getText(mailInput), 'fabijanicmarin6@gmail.com');

      await driver.tap(passInput);
      await driver.enterText('test12');
      await driver.waitFor(passInput);
      //await driver.tap(button);
      await Future<void>.delayed(Duration(milliseconds: 750));
      expect(await driver.getText(passInput), 'test12');

      await driver.tap(button);
      await driver.waitFor(wrongPassWindow);
      await Future<void>.delayed(Duration(milliseconds: 750));
      await driver.tap(okButton);
    });

    test('Enters good credentials', () async {
      await Future<void>.delayed(Duration(milliseconds: 750));
      expect(await driver.getText(passInput), '');
      await driver.tap(passInput);
      await driver.enterText('test123');
      await driver.waitFor(passInput);
      expect(await driver.getText(passInput), 'test123');
      await Future<void>.delayed(Duration(milliseconds: 750));
      await driver.tap(button);
      await Future<void>.delayed(Duration(milliseconds: 750));
    });
  });

  group('Add Course Test', () {
    final plusbutton = find.byValueKey('add-course-button');
    final category = find.byValueKey('category');
    final difficulty = find.byValueKey('difficulty');
    final courseName = find.byValueKey('course-name');
    final shortDesc = find.byValueKey('short-desc');
    final price = find.byValueKey('price');
    final addbutton = find.byValueKey('add-button');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect(logCommunicationToFile: false);
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Enters invalid course name', () async {
      await driver.tap(plusbutton);
      await Future<void>.delayed(Duration(milliseconds: 750));

      await driver.tap(category);
      await Future<void>.delayed(Duration(milliseconds: 350));
      await driver.tap(difficulty);
      await Future<void>.delayed(Duration(milliseconds: 750));

      await driver.tap(courseName);
      await driver.enterText('');
      await driver.waitFor(courseName);
      expect(await driver.getText(courseName), '');
      await Future<void>.delayed(Duration(milliseconds: 750));

      await driver.tap(shortDesc);
      await driver.enterText('Unos opisa u automatskom testu');
      await driver.waitFor(shortDesc);
      expect(await driver.getText(shortDesc), 'Unos opisa u automatskom testu');
      await Future<void>.delayed(Duration(milliseconds: 750));

      await driver.tap(price);
      await driver.enterText('100');
      await driver.waitFor(price);
      expect(await driver.getText(price), '100');
      await Future<void>.delayed(Duration(milliseconds: 750));
      await driver.scrollUntilVisible(find.byValueKey('add-scroll'), addbutton);
      await Future<void>.delayed(Duration(milliseconds: 450));
      await driver.tap(addbutton);
    });

    test('Enters valid course name', () async {
      await Future<void>.delayed(Duration(milliseconds: 250));
      await driver.scrollUntilVisible(
          find.byValueKey('add-scroll'), courseName);
      await Future<void>.delayed(Duration(milliseconds: 450));
      await driver.tap(courseName);
      await driver.enterText('Test Ime');
      await driver.waitFor(courseName);
      expect(await driver.getText(courseName), 'Test Ime');
      await Future<void>.delayed(Duration(milliseconds: 750));
      await driver.scrollUntilVisible(find.byValueKey('add-scroll'), addbutton);
      await Future<void>.delayed(Duration(milliseconds: 450));
      await driver.tap(addbutton);
    });
  });

  group('Edit Profile Test', () {
    final profileButton = find.byValueKey('profile-button');
    final menu = find.byValueKey('menu-icon');
    final editProfile = find.byValueKey('edit-profile');
    final firstName = find.byValueKey('first-name');
    final lastName = find.byValueKey('last-name');
    final about = find.byValueKey('about-input');
    final updatebutton = find.byValueKey('update-button');
    final categoriesbutton = find.byValueKey('categories');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect(logCommunicationToFile: false);
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Enters valid profile info', () async {
      String firstNameInput = 'Marin';
      String lastNameInput = 'Fabijanic';
      String aboutInput = 'About text added through automated test';
      await driver.tap(profileButton);
      await Future<void>.delayed(Duration(milliseconds: 750));

      await driver.tap(menu);
      await Future<void>.delayed(Duration(milliseconds: 750));
      await driver.tap(editProfile);
      await Future<void>.delayed(Duration(milliseconds: 750));

      await driver.tap(firstName);
      await driver.enterText(firstNameInput);
      await driver.waitFor(firstName);
      expect(await driver.getText(firstName), firstNameInput);
      await Future<void>.delayed(Duration(milliseconds: 750));

      await driver.tap(lastName);
      await driver.enterText(lastNameInput);
      await driver.waitFor(lastName);
      expect(await driver.getText(lastName), lastNameInput);
      await Future<void>.delayed(Duration(milliseconds: 750));

      await driver.tap(about);
      await driver.enterText(aboutInput);
      await driver.waitFor(about);
      expect(await driver.getText(about), aboutInput);
      await Future<void>.delayed(Duration(milliseconds: 750));

      await Future<void>.delayed(Duration(milliseconds: 750));
      await driver.scrollUntilVisible(
          find.byValueKey('edit-scroll'), updatebutton);
      await driver.tap(updatebutton);

      await Future<void>.delayed(Duration(milliseconds: 750));
      await driver.tap(categoriesbutton);
      await driver.tap(profileButton);

      expect(await driver.getText(find.byValueKey('firstLast')),
          firstNameInput + ' ' + lastNameInput);

      expect(await driver.getText(find.byValueKey('aboutCheck')), aboutInput);
    });
  });
}
