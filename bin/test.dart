import 'main.dart';

import 'package:test/test.dart';

void main() {

  test('No Strangers', (){
    expect(noStrangers("See Spot run. See Spot jump. Spot likes jumping. See Spot fly."),[["See", "Spot"], []]);
    expect(noStrangers("apple mango apple pear mango apple apple mango apple pear"),[["mango"], ["apple"]]);
    expect(noStrangers("apple mango"),[[], []]);
  });
  test('does rhyme', (){

    expect(doesRhyme("Sam I am!", "Green eggs and ham."),true);

  });
  test('does rhyme', (){

    expect(doesRhyme("aeioudksfjkds", "Green eggs and ham. aeiousjfklsdjf"),true);

  });
  test('can find', (){

    expect(canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat"]),true);

  });
}