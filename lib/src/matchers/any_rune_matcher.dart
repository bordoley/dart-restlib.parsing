part of restlib.parsing;

class _AnyRuneMatcher extends RuneMatcher {
  const _AnyRuneMatcher() : super._internal();
  
  RuneMatcher operator &(final RuneMatcher other) => 
      other;
 
  RuneMatcher operator|(final RuneMatcher other) => 
      this;
  
  bool matches(final int rune) => 
      true;
  
  bool matchesAllOf(final String val) => 
      true;
  
  bool matchesNoneOf(final String val) => 
      false;
  
  RuneMatcher negate() => 
      RuneMatcher.NONE;
  
  String toString() => 
      "*";
}