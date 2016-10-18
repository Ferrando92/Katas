public class Keypad {
  public static int presses(String phrase)
  {
    phrase =  phrase.toUpperCase();
    int presseds = 0;
    for (char letter: phrase.toCharArray())
      //System.out.println(letter);
      presseds +=  getLetterPress((int)letter);
    System.out.println(phrase);
    return presseds;
  }

  public static int getLetterPress(int asciiValue)
  {
    int value = 1;
    if(asciiValue >= 48 && asciiValue <= 57)
    {
     switch (asciiValue)
        {
          case 55: value = 5; break;
          case 57: value = 5; break;
          case 49: value = 1; break;
          case 48: value = 2; break;
          default: value = 3; break;
        }

    }
    if(asciiValue >= 83 && asciiValue <= 90)
      if (asciiValue == 83 || asciiValue == 90)
        value = 4;
      else
        switch (asciiValue%3)
        {
          case 0: value = 1; break;
          case 1: value = 2; break;
          case 2: value = 3; break;
        }
    else if(asciiValue >= 65 && asciiValue <= 82)
       switch (asciiValue%3)
        {
          case 2: value = 1; break;
          case 0: value = 2; break;
          case 1: value = 3; break;
        }
        System.out.println(asciiValue);
    return value;
  }
}
