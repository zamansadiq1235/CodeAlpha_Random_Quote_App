import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import '../data/repo/quotes_repo.dart';
import '../models/quotes_model.dart';

enum QuoteState { initial, loading, loaded, error }

class QuoteViewModel extends ChangeNotifier {
  final QuoteRepository _repository;

  QuoteState _state = QuoteState.initial;
  Quote? _currentQuote;
  Quote? _previousQuote;
  int _quoteCount = 0;
  String? _errorMessage;

  // Getters
  QuoteState get state => _state;
  Quote? get currentQuote => _currentQuote;
  Quote? get previousQuote => _previousQuote;
  int get quoteCount => _quoteCount;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _state == QuoteState.loading;
  bool get hasQuote => _currentQuote != null;

  QuoteViewModel({QuoteRepository? repository})
    : _repository = repository ?? QuoteRepository() {
    // Defer the first load until after the first frame so notifyListeners()
    // is never called during the widget-tree build phase.
    SchedulerBinding.instance.addPostFrameCallback((_) {
      loadInitialQuote();
    });
  }

  void loadInitialQuote() {
    _state = QuoteState.loading;
    notifyListeners();
    try {
      _currentQuote = _repository.getRandomQuote();
      _quoteCount++;
      _state = QuoteState.loaded;
    } catch (e) {
      _state = QuoteState.error;
      _errorMessage = 'Failed to load quote. Please try again.';
    }
    notifyListeners();
  }

  void fetchNewQuote() {
    if (_state == QuoteState.loading) return;

    _state = QuoteState.loading;
    notifyListeners();

    Future.delayed(const Duration(milliseconds: 300), () {
      try {
        _previousQuote = _currentQuote;
        _currentQuote = _repository.getRandomQuoteExcluding(_currentQuote);
        _quoteCount++;
        _state = QuoteState.loaded;
      } catch (e) {
        _state = QuoteState.error;
        _errorMessage = 'Failed to load quote. Please try again.';
      }
      notifyListeners();
    });
  }


  void clearError() {
    _errorMessage = null;
    _state = QuoteState.initial;
    notifyListeners();
  }
}
