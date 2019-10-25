// Challenge 1
// Write test cases for next 2 challenges. Also include tests for boundary conditions
// For this challenge, the input will be a (long) string.


// Challenge 2
// A word encountered for the first time is a stranger.
// A word encountered thrice becomes an acquaintance.
// A word encountered 5 times becomes a friend.

// Create a function that takes the string and returns a list of two lists.
// The first is a list of acquaintances in the order they became an acquaintance (see example).
// The second is a list of friends in the order they became a friend.
// Words in the friend list should no longer be in the acquaintance list.

// Example
// noStrangers("See Spot run. See Spot jump. Spot likes jumping. See Spot fly.")
// ➞ [["spot", "see"], []]
/// "see" was encountered first but "spot" became an acquaintance earlier.
/// /*
///
/*
noStrangers(String statement){
  String toCheck=clean(statement);
  List words=toCheck.split(' ');
  Map<String, int> wordCount={};
  List<String> acq=[];
  List<String> friend=[];
  words.forEach((word){
    wordCount[word]=wordCount.containsKey(word)? wordCount[word]+1:1;
    if(wordCount[word]>=5){
      friend.add(word);
    }
    if(wordCount[word]>=3){
      acq.add(word);
    }
  });
  return [acq,friend];

}*/
noStrangers(String string){
  List wordList=clean(string).split(' ');
  List aquaintance=[];
  List friend=[];
  Map wordListScore={};
  int count=0;
  while(wordList.length>2){

    for(int j=0;j<wordList.length-1;j++){

      if(wordList[0]==wordList[j]){
        count++;
        wordListScore['${wordList[0]}']=count;

        if(count==3)
        {
          aquaintance.add(wordList[0]);
          print("word added to aquaintance");
          print(aquaintance);
        }
        if(count==5){

          friend.add(wordList[0]);
          print("${wordList[0]}added to friend");
          print("Printing friend");
          print(friend);

          aquaintance.remove(wordList[0]);
          print("${wordList[0]}removed from acq");
          print("printing acq");
          print(aquaintance);
        }
      }


    }
    wordList= updateList(wordList,wordList[0]);
    count=0;

  }
  if(wordList.length==2){
    if(wordList[0]==wordList[1]){
      wordListScore['${wordList[0]}']=2;
    }
    else{
      wordListScore['${wordList[0]}']=1;
      wordListScore['${wordList[1]}']=1;
    }

  }
  if(wordList.length==1){
    wordListScore['${wordList[0]}']=1;
  }

  print("printing acq");
  print(aquaintance);
  print("printing friend");
  print(friend);
  print("Printing Map");
  print(wordListScore);
  return [aquaintance,friend];
}
List updateList(List list,String word){
  print("Printing list before updation");
  print(list);
  list.removeWhere((item) => item == word);
  print("printing updated list");
  print(list);
  return list;

}
String clean(String data){
  return data.replaceAll('.','').replaceAll('!','').replaceAll(',', '');
}

// Challenge 3
// Rhyme Time
// Create a function that returns true if two lines rhyme and false otherwise.
// For the purposes of this exercise, two lines rhyme if the last
// word from each sentence contains the same vowels.
// Example:
// doesRhyme("Sam I am!", "Green eggs and ham.") ➞ true
bool doesRhyme(String firstString, String secondString){
  List firstStringList=clean(firstString).split(' ');
  List secondStringList=clean(secondString).split(' ');
  String  firstStringLastWord=firstStringList[firstStringList.length-1];
  String secondStringLastWord=secondStringList[secondStringList.length-1];
 // print(firstStringLastWord);
//  print(secondStringLastWord);
   List first=firstStringLastWord.split('');
   List second=secondStringLastWord.split('');

   first=filterConsonants(first);
   second=filterConsonants(second);
   first.sort();
   second.sort();
 // print(first);
 // print(second);
  if(first.length!=second.length){
    return false;
  }else {
    for(int i=0;i<first.length;i++) {
        if(first[i]!=second[i]){
          return false;
        }
      }
    return true;
  }

}
List<String> filterConsonants(List list){
  List<String> vowels=[];
  for(int i=0;i<list.length;i++)
    {
      if(list[i]=='a'||list[i]=='e'||list[i]=='i'||list[i]=='o'||list[i]=='u') //if the character is a vowel it is added to list of vowels
        {
          vowels.add(list[i]);
        }
    }
 // print(vowels);
  return vowels;
}

// Challenge 4
// Do All Bigrams (2 character words) Exist?
// You are given an input list of bigrams, and a list of words.
//
// Write a function that returns true if you can find every single bigram from
// this list can be found at least once in an list of words.
//
// Examples
// canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat"]) ➞ true

canFind(List<String> bigrams,List<String> words){
 bool isThere=false;
 int count=0;
 for(int i=0;i<bigrams.length;i++)
   {
     isThere=false;
     String toFind=bigrams[i];
     for(int j=0;j<words.length;j++){
       String word=words[j];

       for(int k=0;k<word.length-1;k++)
         {

           if(word.substring(k,k+2)==toFind){

             isThere =true;
             count++;
             break;
           }
         }
       if(isThere) break;
     }
   }

 return count==bigrams.length;
}
main() {
 print(noStrangers("apple mango apple pear mango apple apple mango apple pear"));
 print(noStrangers("See Spot run. See Spot jump. Spot likes jumping. See Spot fly."));
print(noStrangers("apple mango"));

 print(noStrangers(""));
      print(doesRhyme("Sam I am!", "Green eggs and ham."));//true
       print(doesRhyme("Sam I parreiuot", "Green eggs and ham poarreiut"));//true
       print(doesRhyme("Sam red", "Green eggs and ham poarreiut"));//false
       print(doesRhyme("Sam red ", ""));
       print(doesRhyme(" ", ""));
print(canFind(["at", "be", "th", "au"], ["beautiful", "the", "hat"]));
 print(canFind(["xz", "be", "th", "au"], ["beautiful", "the", "hat"]));
}
