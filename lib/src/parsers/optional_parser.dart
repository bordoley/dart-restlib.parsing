part of restlib.parsing;

class _OptionalParser<T> extends AbstractParser<Option<T>> {
  final Parser<T> delegate;
  
  const _OptionalParser(this.delegate);
  
  Option<Option<T>> doParse(final StringIterator itr) =>
      new Option(delegate.parseFrom(itr));
}