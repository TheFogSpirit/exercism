module roman_numerals;

import std.container;
import std.stdio;
import std.typecons;

alias RomanNumeral = Tuple!(int, "arabic", string, "roman");

RomanNumeral romanNumeral(int arabic, string roman) {
  return tuple!("arabic", "roman")(arabic, roman);
}

Array!RomanNumeral romanNumerals() {
  return make!(Array!RomanNumeral)(
    romanNumeral(1000, "M"),
    romanNumeral(900, "CM"),
    romanNumeral(500, "D"),
    romanNumeral(400, "CD"),
    romanNumeral(100, "C"),
    romanNumeral(90, "XC"),
    romanNumeral(50, "L"),
    romanNumeral(40, "XL"),
    romanNumeral(10, "X"),
    romanNumeral(9, "IX"),
    romanNumeral(5, "V"),
    romanNumeral(4, "IV"),
    romanNumeral(1, "I")
  );
}

string convert(int n) {
  string result;

  loop: while (n > 0) {
    foreach (RomanNumeral r; romanNumerals()) {
      if (n / r.arabic > 0) {
        result ~= r.roman;
        n -= r.arabic;
        continue loop;
      }
    }
  }

  return result;
}


unittest
{

// one_yields_I
{
	writefln("Conversion of 1: %s", convert(1));
	assert("I" == convert(1));
}

// two_yields_II
{
	writefln("Conversion of 2: %s", convert(2));
	assert("II" == convert(2));
}

// three_yields_III
{
	writefln("Conversion of 3: %s", convert(3));
	assert("III" == convert(3));
}

// four_yields_IV
{
	writefln("Conversion of 4: %s", convert(4));
	assert("IV" == convert(4));
}

// five_yields_V
{
	writefln("Conversion of 5: %s", convert(5));
	assert("V" == convert(5));
}

// six_yields_VI
{
	writefln("Conversion of 6: %s", convert(6));
	assert("VI" == convert(6));
}

// nine_yields_IX
{
	writefln("Conversion of 9: %s", convert(9));
	assert("IX" == convert(9));
}

// twenty_seven_yields_XXVII
{
	writefln("Conversion of 27: %s", convert(27));
	assert("XXVII" == convert(27));
}

// forty_eight_yields_XLVIII
{
	writefln("Conversion of 48: %s", convert(48));
	assert("XLVIII" == convert(48));
}

// fifty_nine_yields_LIX
{
	writefln("Conversion of 59: %s", convert(59));
	assert("LIX" == convert(59));
}

// ninety_three_yields_XCIII
{
	writefln("Conversion of 93: %s", convert(93));
	assert("XCIII" == convert(93));
}

// one_hundred_forty_one_yields_CXLI
{
	writefln("Conversion of 141: %s", convert(141));
	assert("CXLI" == convert(141));
}

// one_hundred_sixty_three_yields_CLXIII
{
	writefln("Conversion of 163: %s", convert(163));
	assert("CLXIII" == convert(163));
}

// four_hundred_two_yields_CDII
{
	writefln("Conversion of 402: %s", convert(402));
	assert("CDII" == convert(402));
}

// five_hundred_seventy_five_yields_DLXXV
{
	writefln("Conversion of 575: %s", convert(575));
	assert("DLXXV" == convert(575));
}

// nine_hundred_eleven_yields_CMXI
{
	writefln("Conversion of 911: %s", convert(911));
	assert("CMXI" == convert(911));
}

// one_thousand_twenty_four_yields_MXXIV
{
	writefln("Conversion of 1024: %s", convert(1024));
	assert("MXXIV" == convert(1024));
}

// three_thousand_yields_MMM)
{
	writefln("Conversion of 3000: %s", convert(3000));
	assert("MMM" == convert(3000));
}

}
