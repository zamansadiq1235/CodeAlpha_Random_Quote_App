import '../../models/quotes_model.dart';

class QuoteRepository {
  static const List<Quote> _quotes = [
    Quote(
      text: "The only way to do great work is to love what you do.",
      author: "Steve Jobs",
      category: "Inspiration",
    ),
    Quote(
      text: "In the middle of every difficulty lies opportunity.",
      author: "Albert Einstein",
      category: "Wisdom",
    ),
    Quote(
      text: "It does not matter how slowly you go as long as you do not stop.",
      author: "Confucius",
      category: "Perseverance",
    ),
    Quote(
      text: "Life is what happens when you're busy making other plans.",
      author: "John Lennon",
      category: "Life",
    ),
    Quote(
      text: "The future belongs to those who believe in the beauty of their dreams.",
      author: "Eleanor Roosevelt",
      category: "Dreams",
    ),
    Quote(
      text: "Spread love everywhere you go. Let no one ever come to you without leaving happier.",
      author: "Mother Teresa",
      category: "Love",
    ),
    Quote(
      text: "When you reach the end of your rope, tie a knot in it and hang on.",
      author: "Franklin D. Roosevelt",
      category: "Resilience",
    ),
    Quote(
      text: "Always remember that you are absolutely unique. Just like everyone else.",
      author: "Margaret Mead",
      category: "Humor",
    ),
    Quote(
      text: "Do not go where the path may lead, go instead where there is no path and leave a trail.",
      author: "Ralph Waldo Emerson",
      category: "Leadership",
    ),
    Quote(
      text: "You will face many defeats in life, but never let yourself be defeated.",
      author: "Maya Angelou",
      category: "Strength",
    ),
    Quote(
      text: "The greatest glory in living lies not in never falling, but in rising every time we fall.",
      author: "Nelson Mandela",
      category: "Resilience",
    ),
    Quote(
      text: "In the end, it's not the years in your life that count. It's the life in your years.",
      author: "Abraham Lincoln",
      category: "Life",
    ),
    Quote(
      text: "Never let the fear of striking out keep you from playing the game.",
      author: "Babe Ruth",
      category: "Courage",
    ),
    Quote(
      text: "Life is either a daring adventure or nothing at all.",
      author: "Helen Keller",
      category: "Adventure",
    ),
    Quote(
      text: "Many of life's failures are people who did not realize how close they were to success when they gave up.",
      author: "Thomas A. Edison",
      category: "Perseverance",
    ),
    Quote(
      text: "You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose.",
      author: "Dr. Seuss",
      category: "Motivation",
    ),
    Quote(
      text: "If life were predictable it would cease to be life, and be without flavor.",
      author: "Eleanor Roosevelt",
      category: "Life",
    ),
    Quote(
      text: "If you look at what you have in life, you'll always have more. If you look at what you don't have in life, you'll never have enough.",
      author: "Oprah Winfrey",
      category: "Gratitude",
    ),
    Quote(
      text: "If you want to live a happy life, tie it to a goal, not to people or things.",
      author: "Albert Einstein",
      category: "Happiness",
    ),
    Quote(
      text: "Money and success don't change people; they merely amplify what is already there.",
      author: "Will Smith",
      category: "Success",
    ),
    Quote(
      text: "Your time is limited, so don't waste it living someone else's life.",
      author: "Steve Jobs",
      category: "Life",
    ),
    Quote(
      text: "Not how long, but how well you have lived is the main thing.",
      author: "Seneca",
      category: "Wisdom",
    ),
    Quote(
      text: "If you're not positive energy, you're negative energy.",
      author: "Mark Cuban",
      category: "Motivation",
    ),
    Quote(
      text: "Dreaming, after all, is a form of planning.",
      author: "Gloria Steinem",
      category: "Dreams",
    ),
    Quote(
      text: "It's not whether you get knocked down, it's whether you get up.",
      author: "Vince Lombardi",
      category: "Resilience",
    ),
    Quote(
      text: "We become what we think about.",
      author: "Earl Nightingale",
      category: "Mindset",
    ),
    Quote(
      text: "Twenty years from now you will be more disappointed by the things that you didn't do than by the ones you did do.",
      author: "Mark Twain",
      category: "Regret",
    ),
    Quote(
      text: "Everything you've ever wanted is on the other side of fear.",
      author: "George Addair",
      category: "Courage",
    ),
    Quote(
      text: "Success is not final, failure is not fatal: it is the courage to continue that counts.",
      author: "Winston Churchill",
      category: "Success",
    ),
    Quote(
      text: "Believe you can and you're halfway there.",
      author: "Theodore Roosevelt",
      category: "Belief",
    ),
    Quote(
      text: "Act as if what you do makes a difference. It does.",
      author: "William James",
      category: "Impact",
    ),
    Quote(
      text: "What lies behind us and what lies before us are tiny matters compared to what lies within us.",
      author: "Ralph Waldo Emerson",
      category: "Inner Strength",
    ),
    Quote(
      text: "The only limit to our realization of tomorrow will be our doubts of today.",
      author: "Franklin D. Roosevelt",
      category: "Mindset",
    ),
    Quote(
      text: "Do what you can, with what you have, where you are.",
      author: "Theodore Roosevelt",
      category: "Action",
    ),
    Quote(
      text: "It always seems impossible until it's done.",
      author: "Nelson Mandela",
      category: "Perseverance",
    ),
    Quote(
      text: "You miss 100% of the shots you don't take.",
      author: "Wayne Gretzky",
      category: "Courage",
    ),
    Quote(
      text: "Whether you think you can or you think you can't, you're right.",
      author: "Henry Ford",
      category: "Mindset",
    ),
    Quote(
      text: "I have learned over the years that when one's mind is made up, this diminishes fear.",
      author: "Rosa Parks",
      category: "Courage",
    ),
    Quote(
      text: "The best time to plant a tree was 20 years ago. The second best time is now.",
      author: "Chinese Proverb",
      category: "Action",
    ),
    Quote(
      text: "An unexamined life is not worth living.",
      author: "Socrates",
      category: "Wisdom",
    ),
    Quote(
      text: "The wound is the place where the light enters you.",
      author: "Rumi",
      category: "Healing",
    ),
    Quote(
      text: "The purpose of our lives is to be happy.",
      author: "Dalai Lama",
      category: "Happiness",
    ),
    Quote(
      text: "Get busy living or get busy dying.",
      author: "Stephen King",
      category: "Life",
    ),
    Quote(
      text: "You only live once, but if you do it right, once is enough.",
      author: "Mae West",
      category: "Life",
    ),
    Quote(
      text: "In three words I can sum up everything I've learned about life: it goes on.",
      author: "Robert Frost",
      category: "Life",
    ),
    Quote(
      text: "To handle yourself, use your head; to handle others, use your heart.",
      author: "Eleanor Roosevelt",
      category: "Leadership",
    ),
    Quote(
      text: "Too many of us are not living our dreams because we are living our fears.",
      author: "Les Brown",
      category: "Dreams",
    ),
    Quote(
      text: "Happiness is not something ready-made. It comes from your own actions.",
      author: "Dalai Lama",
      category: "Happiness",
    ),
    Quote(
      text: "The mind is everything. What you think you become.",
      author: "Buddha",
      category: "Mindset",
    ),
    Quote(
      text: "Strive not to be a success, but rather to be of value.",
      author: "Albert Einstein",
      category: "Purpose",
    ),
    Quote(
      text: "I attribute my success to this: I never gave or took any excuse.",
      author: "Florence Nightingale",
      category: "Success",
    ),
    Quote(
      text: "You can never cross the ocean until you have the courage to lose sight of the shore.",
      author: "Christopher Columbus",
      category: "Courage",
    ),
    Quote(
      text: "Either you run the day or the day runs you.",
      author: "Jim Rohn",
      category: "Motivation",
    ),
    Quote(
      text: "Life is not measured by the number of breaths we take, but by the moments that take our breath away.",
      author: "Maya Angelou",
      category: "Life",
    ),
    Quote(
      text: "Limitations live only in our minds. But if we use our imaginations, our possibilities become limitless.",
      author: "Jamie Paolinetti",
      category: "Imagination",
    ),
    Quote(
      text: "If you want to achieve excellence, you can get there today. As of this second, quit doing less-than-excellent work.",
      author: "Thomas J. Watson",
      category: "Excellence",
    ),
    Quote(
      text: "A person who never made a mistake never tried anything new.",
      author: "Albert Einstein",
      category: "Growth",
    ),
    Quote(
      text: "The secret of getting ahead is getting started.",
      author: "Mark Twain",
      category: "Action",
    ),
    Quote(
      text: "It is never too late to be what you might have been.",
      author: "George Eliot",
      category: "Hope",
    ),
  ];

  // Returns a mutable copy so callers can safely shuffle/filter
  List<Quote> getAllQuotes() => List.of(_quotes);

  Quote getRandomQuote() {
    final quotes = getAllQuotes();
    quotes.shuffle();
    return quotes.first;
  }

  Quote getRandomQuoteExcluding(Quote? current) {
    final quotes = getAllQuotes();
    if (current == null || quotes.length <= 1) {
      quotes.shuffle();
      return quotes.first;
    }
    final filtered = quotes.where((q) => q != current).toList();
    filtered.shuffle();
    return filtered.first;
  }
}