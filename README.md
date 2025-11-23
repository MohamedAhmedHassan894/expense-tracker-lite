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

<table>
  <tr>
    <td align="center">
      <img src="screenshots/dashboard.png" width="250" alt="Dashboard Screen"/>
      <br />
      <b>Dashboard Screen</b>
      <br />
      <sub>View balance, income, expenses with filter options</sub>
    </td>
    <td align="center">
      <img src="screenshots/add_expense.png" width="250" alt="Add Expense Screen"/>
      <br />
      <b>Add Expense Screen</b>
      <br />
      <sub>Add expenses with category, amount, currency & receipt</sub>
    </td>
    <td align="center">
      <img src="screenshots/category_selection.png" width="250" alt="Category Selection"/>
      <br />
      <b>Category Selection</b>
      <br />
      <sub>Choose from predefined expense categories</sub>
    </td>
  </tr>
</table>

### Key UI Features Demonstrated
- ✅ **Beautiful gradient header** with total balance overview
- ✅ **Income & Expense cards** showing financial summary
- ✅ **Filter buttons** (All, This Month, Last 7 Days)
- ✅ **Recent expenses list** with category icons and amounts
- ✅ **Floating action button** for quick expense addition
- ✅ **Category grid/dropdown** with colorful icons
- ✅ **Multi-currency support** with dropdown selector
- ✅ **Date picker** for expense date selection
- ✅ **Receipt upload** with camera/gallery integration
- ✅ **Success feedback** with green snackbar notification

## 🚀 Getting Started

### Prerequisites
- Flutter SDK: `3.32.0` (managed via FVM)
- Dart SDK: `>=3.3.1 <4.0.0`
- Android Studio / Xcode (for mobile development)
- Git
- **[FVM (Flutter Version Manager)](https://fvm.app/)** (recommended) - Optional but recommended for version consistency

### Flutter Version Management

This project uses **FVM (Flutter Version Manager)** to ensure consistent Flutter versions across different development environments. The Flutter version is locked at `3.32.0`.

#### Option 1: Using FVM (Recommended)
If you have FVM installed, prefix all `flutter` commands with `fvm`:
```bash
# Install FVM globally
dart pub global activate fvm

# Install the project's Flutter version
fvm install

# Use FVM for all Flutter commands
fvm flutter pub get
fvm flutter run
```

#### Option 2: Without FVM
If you don't have FVM, you can use Flutter commands directly, but ensure you have Flutter `3.32.0` installed:
```bash
# Use regular Flutter commands
flutter pub get
flutter run
```

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/MohamedAhmedHassan894/expense-tracker-lite.git
   cd expense-tracker-lite
   ```

2. **Install dependencies**
   ```bash
   # With FVM
   fvm flutter pub get
   
   # Without FVM
   flutter pub get
   ```

3. **Run code generation** (for freezed, json_serializable, hive, retrofit)
   ```bash
   # With FVM
   fvm flutter pub run build_runner build --delete-conflicting-outputs
   
   # Without FVM
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   # With FVM
   fvm flutter run
   fvm flutter run -d <device_id>
   fvm flutter run --release
   
   # Without FVM
   flutter run
   flutter run -d <device_id>
   flutter run --release
   ```

### Build APK/IPA

```bash
# With FVM
fvm flutter build apk --release
fvm flutter build appbundle --release
fvm flutter build ios --release

# Without FVM
flutter build apk --release
flutter build appbundle --release
flutter build ios --release
```

## 🧪 Testing

### Run Tests
```bash
# With FVM
fvm flutter test
fvm flutter test --coverage

# Without FVM
flutter test
flutter test --coverage

# View coverage report (same for both)
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

## 🚀 CI/CD Pipeline

### GitHub Actions

This project includes a GitHub Actions workflow for automated Android builds and Firebase App Distribution.

**Workflow File**: `.github/workflows/android_fastlane_firebase_app_distribution_workflow.yml`

#### Features
- ✅ **Automated Builds**: Triggers on push to `main` branch
- ✅ **FVM Integration**: Uses project's Flutter version (3.32.0) automatically
- ✅ **Fastlane**: Automates build and deployment process
- ✅ **Firebase App Distribution**: Distributes builds to testers
- ✅ **Java 21**: Uses latest Temurin distribution
- ✅ **Ruby 3.3.4**: For Fastlane dependencies

#### Workflow Steps
1. Checkout repository code
2. Set up Java 21 and Ruby 3.3.4
3. Install FVM and project's Flutter SDK version
4. Run Fastlane for building and distribution
5. Upload APK to Firebase App Distribution

#### Setup Requirements
To use the CI/CD pipeline, configure these GitHub Secrets:
- `FIREBASE_APP_ID`: Firebase App ID
- `FIREBASE_TOKEN`: Firebase CLI token
- Additional secrets as needed for signing

For more details, check the workflow file in `.github/workflows/`.

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
