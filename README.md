# Expense Tracker Lite 💰

A lightweight, offline-first expense tracking mobile application built with Flutter. This app allows users to track their daily expenses, categorize them, and view spending insights with beautiful UI and smooth animations.

## 📱 Features

- ✅ **Add Expenses**: Track expenses with category, amount, currency, date, and optional receipt image
- ✅ **Multi-Currency Support**: Automatic conversion to USD using real-time exchange rates API
- ✅ **Offline-First**: All data stored locally using Hive database - works completely offline
- ✅ **Smart Filtering**: Filter expenses by date range (All, This Month, Last 7 Days, Custom)
- ✅ **Pagination**: Memory-efficient local pagination (10 items per page)
- ✅ **Delete Expenses**: Swipe to delete with confirmation
- ✅ **Collapsible Dashboard**: Beautiful animated header with balance overview
- ✅ **Pull to Refresh**: Refresh dashboard data with pull-down gesture
- ✅ **Receipt Upload**: Camera/gallery integration for receipt images

## 🏗️ Architecture

This project follows **Clean Architecture** principles with feature-based organization:

```
lib/
├── core/
│   ├── di/                     # Dependency Injection (GetIt)
│   ├── helpers/                # Utilities, extensions, categories
│   ├── networking/             # API client, error handling, result wrappers
│   ├── routing/                # App navigation
│   └── theming/                # Colors, themes
│
├── features/
│   ├── dashboard/
│   │   ├── data/
│   │   │   ├── models/         # Data models (Expense, Currency)
│   │   │   ├── services/       # API service, Local data source
│   │   │   └── repo/           # Repository (data layer abstraction)
│   │   ├── logic/
│   │   │   └── bloc/           # BLoC (state management)
│   │   └── ui/
│   │       ├── screens/        # Dashboard screen
│   │       └── widgets/        # Reusable UI components
│   │
│   └── add_expense/
│       ├── logic/              # Add expense BLoC
│       └── ui/                 # Add expense screen & widgets
│
├── expenses_app.dart           # App configuration
└── main.dart                   # Entry point
```

### Architecture Layers

1. **Presentation Layer** (`ui/`, `logic/`): Flutter widgets and BLoC state management
2. **Domain Layer** (implicit): Business logic within BLoCs and repositories
3. **Data Layer** (`data/`): Models, API services, local storage, repositories

## 🔄 State Management

The app uses **BLoC (Business Logic Component)** pattern with `flutter_bloc`:

### Dashboard BLoC
- **Events**: `LoadExpenses`, `FilterByDateRange`, `FilterByThisMonth`, `FilterByLast7Days`, `LoadMoreExpenses`, `RefreshExpenses`, `DeleteExpense`
- **States**: `Initial`, `Loading`, `LoadingMore`, `Success`, `Error`
- **Features**:
  - Manages expense list state
  - Handles filtering logic
  - Implements pagination
  - Calculates totals (income, expenses, balance)

### Add Expense BLoC
- **Events**: `CategoryChanged`, `AmountChanged`, `CurrencyChanged`, `DateChanged`, `ReceiptSelected`, `SaveExpense`
- **States**: `Initial`, `Loading`, `Success`, `Error`
- **Features**:
  - Form validation
  - Currency conversion via API
  - Expense persistence

### Benefits of BLoC
- ✅ Clear separation of business logic and UI
- ✅ Testable (unit tests for business logic)
- ✅ Reactive and predictable state updates
- ✅ Built-in stream support for async operations

## 🌐 API Integration

### Currency Exchange API
- **Provider**: [ExchangeRate-API](https://open.er-api.com/)
- **Endpoint**: `GET /v6/latest/{baseCurrency}`
- **Purpose**: Real-time currency conversion to USD for unified reporting
- **Implementation**: Retrofit + Dio for type-safe API calls

```dart
@RestApi(baseUrl: 'https://open.er-api.com/v6/')
abstract class CurrencyApiService {
  @GET('latest/{baseCurrency}')
  Future<CurrencyResponseModel> getExchangeRates(
    @Path('baseCurrency') String baseCurrency,
  );
}
```

### API Flow
1. User selects currency (USD, EUR, GBP, EGP, etc.)
2. When saving expense, app fetches exchange rate
3. Amount converted to USD and stored alongside original amount
4. Allows unified calculations across different currencies

### Error Handling
- Network errors gracefully handled with user-friendly messages
- Falls back to stored expense if conversion fails
- Offline mode: only USD expenses work without API

## 💾 Local Storage (Hive)

### Why Hive?
- ⚡ **Fast**: Pure Dart, no native dependencies
- 🪶 **Lightweight**: Minimal footprint
- 📦 **Type-safe**: Code generation for models
- 🔒 **Secure**: Encrypted boxes support (not used in this app)

### Implementation
```dart
@HiveType(typeId: 0)
class ExpenseModel {
  @HiveField(0) final String id;
  @HiveField(1) final String category;
  @HiveField(2) final double amount;
  @HiveField(3) final String currency;
  @HiveField(4) final double amountInUSD;
  @HiveField(5) final DateTime date;
  @HiveField(6) final String? receiptPath;
  @HiveField(7) final DateTime createdAt;
}
```

### Data Operations
- **CRUD**: Create, Read, Update, Delete expenses
- **Filtering**: Date range queries (O(n) filtering)
- **Sorting**: By date (newest first)
- **Persistence**: Data survives app restarts

## 📄 Pagination Strategy

### Local Pagination (Implemented)
- **Approach**: Load all data from Hive, paginate in memory
- **Page Size**: 10 items
- **Implementation**: 
  - `expenses`: Full list from database
  - `displayedExpenses`: Currently shown items
  - `hasMoreData`: Boolean flag for infinite scroll
  - `LoadMoreExpenses` event: Loads next page

### Why Local Pagination?
✅ **Pros**:
- Simple implementation
- Instant filtering (all data in memory)
- No backend required
- Perfect for small-medium datasets (<1000 items)

❌ **Cons**:
- Memory usage grows with dataset size
- Initial load time increases with data

### API Pagination (Not Implemented)
For production apps with large datasets:
- Server-side pagination with `limit`/`offset`
- API returns paginated results
- Requires backend changes

**Trade-off Decision**: Local pagination chosen due to:
1. Offline-first architecture
2. Expected dataset size (<500 expenses)
3. Better filtering UX (instant results)

## 🎨 UI Features

### Dashboard
- **Collapsible AppBar**: Gradient header with balance cards
- **Sticky Filters**: Filter buttons stay visible while scrolling
- **Infinite Scroll**: Load more expenses on scroll
- **Pull to Refresh**: Swipe down to refresh
- **Empty State**: Shows prompt when no expenses exist

### Add Expense
- **Category Grid**: Visual category selection
- **Date Picker**: Intuitive date selection
- **Currency Dropdown**: Multi-currency support
- **Receipt Upload**: Camera/gallery integration
- **Form Validation**: Real-time error messages

### Design System
- **Responsive**: Uses `flutter_screenutil` for adaptive sizing
- **Colors**: Material Design inspired palette
- **Animations**: Smooth transitions and loading states

## 📸 Screenshots

> **Note**: Add screenshots here after running the app

### Dashboard
```
[ Screenshot of dashboard with expenses list ]
```

### Filtering
```
[ Screenshot of filter options ]
```

### Add Expense
```
[ Screenshot of add expense form ]
```

### Empty State
```
[ Screenshot of empty state ]
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK: `>=3.3.1 <4.0.0`
- Dart SDK: `>=3.3.1 <4.0.0`
- Android Studio / Xcode (for mobile development)
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/MohamedAhmedHassan894/expense-tracker-lite.git
   cd expense-tracker-lite
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run code generation** (for freezed, json_serializable, hive, retrofit)
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   # Run on connected device/emulator
   flutter run
   
   # Run on specific device
   flutter run -d <device_id>
   
   # Run in release mode
   flutter run --release
   ```

### Build APK/IPA

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS (requires Mac)
flutter build ios --release
```

## 🧪 Testing

### Run Tests
```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage

# View coverage report
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Test Structure
```
test/
└── features/
    ├── dashboard/
    │   └── logic/
    │       └── dashboard_bloc_test.dart
    └── add_expense/
        └── logic/
            └── add_expense_bloc_test.dart
```

### Testing Approach
- **BLoC Tests**: Using `bloc_test` package
- **Mocking**: `mocktail` for dependency mocking
- **Coverage**: Focusing on business logic (BLoCs, repositories)

## 📦 Dependencies

### Core
- `flutter_bloc: ^8.1.6` - State management
- `get_it: ^9.1.0` - Dependency injection
- `hive: ^2.2.3` - Local database
- `freezed: ^2.5.7` - Code generation for unions/sealed classes

### Networking
- `dio: ^5.9.0` - HTTP client
- `retrofit: ^4.0.1` - Type-safe API client
- `pretty_dio_logger: ^1.4.0` - Request/response logging

### UI
- `flutter_screenutil: ^5.9.3` - Responsive UI
- `image_picker: ^1.0.4` - Camera/gallery access
- `intl: ^0.18.1` - Date formatting

### Utilities
- `path_provider: ^2.1.1` - File system paths
- `shared_preferences: ^2.2.2` - Simple key-value storage
- `uuid: ^4.5.2` - Unique ID generation

## ⚖️ Trade-offs & Assumptions

### Trade-offs

1. **Local Pagination vs API Pagination**
   - Chose local pagination for simplicity and better offline support
   - Trade-off: Not scalable for very large datasets

2. **Hive vs SQLite**
   - Chose Hive for faster development and pure Dart implementation
   - Trade-off: Less mature ecosystem, no complex queries

3. **BLoC vs Riverpod/Provider**
   - Chose BLoC for explicit state management and testing
   - Trade-off: More boilerplate code

4. **Fixed Income Value**
   - Hardcoded income value (10840.0) for demo purposes
   - Trade-off: Would need income tracking feature in production

5. **Currency Conversion on Save**
   - Convert to USD when saving expense
   - Trade-off: Exchange rates not updated for old expenses

### Assumptions

1. **Dataset Size**: Assuming <1000 expenses per user
2. **Internet for Currency**: Non-USD currencies require internet connection
3. **USD as Base**: All calculations use USD for consistency
4. **Single User**: No multi-user support or authentication
5. **Receipt Storage**: Receipt paths stored as strings (file system)
6. **Categories Fixed**: Predefined categories (no custom categories)
7. **Income Static**: Demo assumes fixed monthly income
8. **No Backup**: Data only stored locally (no cloud sync)

## 🐛 Known Issues & Limitations

### Known Bugs
- ⚠️ None currently identified

### Unimplemented Features
- ❌ **User Authentication**: No login/signup
- ❌ **Cloud Sync**: No backup/restore functionality
- ❌ **Income Tracking**: Income is hardcoded
- ❌ **Custom Categories**: Fixed category list
- ❌ **Budget Limits**: No spending limit alerts
- ❌ **Charts/Analytics**: No visual spending analytics
- ❌ **Export Data**: No CSV/PDF export
- ❌ **Search**: No search functionality
- ❌ **Recurring Expenses**: No support for recurring transactions
- ❌ **Multi-Device**: No cross-device synchronization
- ❌ **Notifications**: No spending reminders
- ❌ **Dark Mode**: Only light theme available

### Future Enhancements
1. Add visual analytics (pie charts, bar graphs)
2. Implement budget tracking with alerts
3. Add income tracking feature
4. Cloud backup with Firebase
5. Search and advanced filtering
6. Dark mode support
7. Export reports (PDF/CSV)
8. Recurring expense templates
9. OCR for receipt parsing
10. Multi-language support

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

**Mohamed Ahmed Hassan**
- GitHub: [@MohamedAhmedHassan894](https://github.com/MohamedAhmedHassan894)

## 🙏 Acknowledgments

- [ExchangeRate-API](https://www.exchangerate-api.com/) for free currency data
- Flutter team for amazing framework
- Community packages that made this possible

---

**Made with ❤️ and Flutter**
