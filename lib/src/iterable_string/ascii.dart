part of parsing;

class _AsciiString extends IterableBase<int> implements IterableString {
  final List<int> _bytes;

  const _AsciiString(this._bytes);

  bool get isEmpty =>
      _bytes.isEmpty;

  int get length =>
      _bytes.length;

  CodePointIterator get iterator =>
      new _AsciiIterator(this);

  IterableString substring(int startIndex, [int endIndex]) =>
      new _AsciiString(sublist(this._bytes, startIndex, endIndex - startIndex));

  String toString() =>
      ASCII.decode(_bytes, allowInvalid:false);
}

class _AsciiIterator
    extends Object
    with ForwardingIterator<int>,
      ForwardingBidirectionalIterator<int>,
      ForwardingIndexedIterator<int>
    implements CodePointIterator {
  final IndexedIterator<int> delegate;
  final _AsciiString iterable;

  bool reachedEof = false;

  _AsciiIterator(final _AsciiString str) :
    this.delegate = new IndexedIterator.list(str._bytes),
    this.iterable = str;

  int get current {
    final int retval = delegate.current;

    checkState(retval < 128 && retval >=0);
    return retval;
  }

  void set index(final int index) {
    super.index = index;
    if (index < delegate.iterable.length) {
      reachedEof = false;
    }
  }

  bool moveNext() {
    if (reachedEof) {
      return false;
    }

    if (!reachedEof && !super.moveNext()) {
      reachedEof = true;
      return false;
    }

    return true;
  }

  bool movePrevious() {
    reachedEof = false;
    return super.movePrevious();
  }
}