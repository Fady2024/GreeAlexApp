# 🌱 GreeAlex - Sustainable Living & Environmental Action Platform

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web-blue?style=for-the-badge)](https://flutter.dev)

**GreeAlex** is a comprehensive mobile application designed to promote environmental sustainability and community engagement in Alexandria, Egypt. Developed with passion by **Eng. Fady Gerges Kodsy** in strategic partnership with **AlexBank**, this app empowers users to take meaningful environmental actions, participate in volunteer opportunities, earn rewards, and connect with like-minded individuals through an AI-powered chatbot assistant.

---

## 🌟 Vision & Mission

**Our Vision:** To establish Alexandria as a leading model for urban sustainability, where technology and community collaboration create a thriving, green ecosystem for future generations.

**Our Mission:** To provide an engaging, accessible, and rewarding platform that educates, motivates, and mobilizes individuals and organizations to adopt and promote eco-friendly practices throughout the city.

---

## ✨ Key Features Overview

### 🏠 **Home Dashboard**
- **Personalized Welcome**: Dynamic greeting with user's name and current Green Points (GP) balance
- **Eco Actions Hub**: Curated list of sustainable activities with point rewards
- **Volunteer Opportunities**: Real-time listing of environmental volunteer events in Alexandria
- **Points System**: Gamified experience encouraging continuous environmental engagement
- **Partner Integration**: Direct access to partner organizations and exclusive offers

### 🤖 **AI-Powered Chatbot Assistant**
- **Environmental Guidance**: Expert advice on sustainability practices and eco-friendly living
- **Banking Integration**: Information about green banking products and eco-friendly financial services
- **Event Information**: Comprehensive details about upcoming environmental events and activities
- **Points Assistance**: Help with understanding and maximizing the Green Points system
- **Multi-language Support**: Full functionality in both English and Arabic with RTL support
- **Interactive Help System**: Contextual assistance and educational content

### 👤 **User Profile & Progress Tracking**
- **Comprehensive Profile**: Personal information, achievements, and environmental impact statistics
- **Eco Hero Badges**: Recognition system for environmental contributions and milestones
- **Volunteering History**: Complete record of past volunteer activities with organizations
- **Points Tracking**: Detailed breakdown of earned points across different activity categories
- **Achievement System**: Milestone celebrations and progress indicators for motivation
- **Activity Analytics**: Visual representation of environmental impact over time

### 🏆 **Leaderboard & Rewards System**
- **Community Rankings**: Real-time leaderboard showing top environmental champions
- **Reward Catalog**: Extensive collection of eco-friendly products and services for redemption
- **Promotional Offers**: Special deals and discounts from partner organizations
- **Achievement Sharing**: Social features to share environmental accomplishments
- **Seasonal Challenges**: Time-limited events and competitions for extra engagement

### 🤝 **Partners Network Integration**
- **Local Organizations**: Connect with environmental groups and NGOs in Alexandria
- **Business Partners**: Eco-friendly businesses offering rewards, discounts, and services
- **Government Initiatives**: Information about official environmental programs and policies
- **Community Groups**: Join local sustainability communities and environmental movements
- **Educational Institutions**: Partnerships with schools and universities for environmental education

### 📱 **Additional Technical Features**
- **QR Code Scanner**: Quick access to events, partner offers, and activity verification
- **Multi-language Interface**: Complete localization for English and Arabic speakers
- **Responsive Design**: Optimized experience across mobile, tablet, and web platforms
- **Offline Capabilities**: Core features available without internet connection
- **Phone Frame Wrapper**: Elegant web presentation with mobile-like interface

---

## 🏗️ Technical Architecture

### **Clean Architecture Implementation**
GreeAlex follows clean architecture principles with clear separation of concerns and modular design:

```
lib/
├── core/                     # Core application infrastructure
│   ├── constants/           # Application constants and asset paths
│   │   └── assets.dart     # Centralized asset management
│   └── theme/              # UI theming and design system
│       ├── app_theme.dart  # Main theme configuration
│       ├── colors.dart     # Color palette and gradients
│       └── typography.dart # Text styles and font definitions
├── features/               # Feature-based modular architecture
│   ├── chatbot/           # AI chatbot functionality
│   │   ├── domain/
│   │   │   ├── models/    # Chat message models
│   │   │   └── services/  # Chatbot service logic
│   │   └── presentation/
│   │       ├── screens/   # Chatbot interface
│   │       └── widgets/   # Chat components
│   ├── home/              # Main dashboard and eco actions
│   │   ├── domain/
│   │   │   └── models/    # Eco action and volunteer models
│   │   └── presentation/
│   │       ├── screens/   # Home screen
│   │       └── widgets/   # Action cards and components
│   ├── layout/            # Application layout and navigation
│   ├── leaderboard/       # Rankings and competitive features
│   ├── navigation/        # Navigation logic and routing
│   ├── partners/          # Partner organizations integration
│   ├── profile/           # User profile and history
│   ├── qr_scanner/        # QR code scanning functionality
│   ├── rewards/           # Rewards and redemption system
│   └── welcome/           # Onboarding and welcome screens
├── l10n/                  # Internationalization and localization
│   ├── app_localizations.dart      # Main localization class
│   ├── app_localizations_ar.dart   # Arabic translations
│   └── app_localizations_en.dart   # English translations
└── main.dart             # Application entry point
```

### **Feature Structure Pattern**
Each feature follows a consistent domain-driven design pattern:

```
feature/
├── domain/
│   ├── models/           # Data models and entities
│   └── services/         # Business logic and services
└── presentation/
    ├── screens/          # UI screens and pages
    └── widgets/          # Reusable UI components
```

### **Core Design System Components**

#### **Theme Architecture**
- **AppTheme**: Centralized theme configuration with Material Design 3
- **AppColors**: Comprehensive color palette with environmental gradients
- **AppTypography**: Poppins font family with hierarchical text styles
- **Component Themes**: Consistent styling for buttons, cards, inputs, and navigation

#### **Localization Framework**
- **Multi-language Support**: Complete English and Arabic localization
- **RTL Layout Support**: Right-to-left text direction for Arabic interface
- **Dynamic Text Loading**: Context-aware text rendering and cultural adaptation
- **Asset Localization**: Language-specific images and cultural content

---

## 🚀 Getting Started

### **Prerequisites**
- **Flutter SDK**: Version 3.0.0 or higher
- **Dart SDK**: Version 2.17.0 or higher
- **Android Studio** or **VS Code** with Flutter extensions
- **Git** for version control
- **Android/iOS development tools** for mobile deployment

### **Installation & Setup**

1. **Clone the Repository**
   ```bash
   git clone https://github.com/FadyKodsy/gree_alex.git
   cd gree_alex
   ```

2. **Install Flutter Dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate Localization Files**
   ```bash
   flutter gen-l10n
   ```

4. **Verify Flutter Installation**
   ```bash
   flutter doctor
   ```

5. **Run the Application**
   ```bash
   # For mobile development (Android/iOS)
   flutter run
   
   # For web development
   flutter run -d chrome
   
   # For specific device
   flutter devices
   flutter run -d <device_id>
   ```

### **Development Environment Setup**

#### **IDE Configuration**
- Install Flutter and Dart plugins for your preferred IDE
- Configure code formatting with `dartfmt`
- Set up debugging configurations for different platforms
- Enable hot reload for faster development cycles

#### **Asset Management**
Ensure all required assets are properly configured in `pubspec.yaml`:
- Images stored in `assets/images/`
- Icons organized in `assets/icons/`
- Fonts configured in `assets/fonts/`

---

## 🎨 Design System & UI Guidelines

### **Color Palette**
```dart
// Primary Environmental Colors
Primary: #2E7D32 (Forest Green)
Secondary: #66BB6A (Light Green)
Accent: #4CAF50 (Material Green)

// Supporting Colors
Background: #F8F9FA (Off White)
Surface: #FFFFFF (Pure White)
Error: #F44336 (Material Red)

// Text Hierarchy
Primary Text: #212121 (Dark Grey)
Secondary Text: #757575 (Medium Grey)
Hint Text: #BDBDBD (Light Grey)
```

### **Typography System**
- **Display Large (32px, Bold)**: Main headings and hero text
- **Display Medium (28px, Bold)**: Section headers and important titles
- **Display Small (24px, Bold)**: Subsection headers and card titles
- **Body Large (16px, Regular)**: Primary body text and descriptions
- **Body Medium (14px, Regular)**: Secondary body text and captions
- **Body Small (12px, Regular)**: Labels, hints, and fine print

### **Component Design Principles**
- **Cards**: 16px border radius with subtle elevation and shadows
- **Buttons**: 12px border radius with consistent padding and states
- **Input Fields**: 12px border radius with clear focus and error states
- **Icons**: 24px standard size with consistent visual weight
- **Gradients**: Environmental-inspired green gradients for primary elements

---

## 📱 Application User Flow

### **User Journey Mapping**

1. **Welcome & Onboarding**
   - App introduction with environmental mission statement
   - Language selection (English/Arabic) with cultural preferences
   - Initial user registration and profile setup
   - Tutorial walkthrough of key features and navigation

2. **Home Dashboard Experience**
   - Personalized greeting with current Green Points balance
   - Browse curated eco-actions with difficulty levels and point values
   - Discover local volunteer opportunities with event details
   - Access partner offers and exclusive environmental services

3. **Environmental Action Participation**
   - Select from categorized eco-friendly actions (recycling, energy, transport)
   - Complete activities with photo verification and QR code scanning
   - Track progress with real-time point accumulation
   - Share achievements and inspire community participation

4. **Community Engagement & Learning**
   - Participate in local volunteer events and environmental initiatives
   - Interact with AI chatbot for personalized environmental guidance
   - Compare progress on community leaderboards and rankings
   - Connect with local environmental groups and like-minded individuals

5. **Rewards & Recognition System**
   - Redeem accumulated points for eco-friendly products and services
   - Unlock achievement badges and environmental hero status
   - Access exclusive partner discounts and promotional offers
   - Celebrate environmental milestones with community recognition

---

## 🛠️ Development Guidelines

### **Code Organization Standards**
- Follow feature-based folder structure for scalability
- Implement clean architecture with clear layer separation
- Use consistent naming conventions across all files and classes
- Maintain strict separation of concerns between business logic and UI

### **State Management Approach**
- **StatefulWidget**: For local component state and simple interactions
- **ValueNotifier**: For reactive state updates and efficient rebuilds
- **Provider Pattern**: For app-wide state management when complexity increases
- **Immutable Data Models**: Ensure data consistency and predictable state changes

### **Performance Optimization Strategies**
- **Lazy Loading**: Implement for large lists and heavy content
- **Image Optimization**: Use appropriate formats and caching strategies
- **Widget Efficiency**: Minimize unnecessary rebuilds with const constructors
- **Memory Management**: Proper disposal of controllers and listeners

### **Testing & Quality Assurance**
- **Unit Tests**: Comprehensive coverage for business logic and services
- **Widget Tests**: UI component testing with various states and interactions
- **Integration Tests**: End-to-end user flow validation
- **Performance Testing**: Critical path optimization and memory profiling

---

## 🌍 Localization & Accessibility

### **Multi-language Support**
- **English (en)**: Primary language with comprehensive content
- **Arabic (ar)**: Full RTL support with cultural adaptations
- **Extensible Framework**: Easy addition of new languages and regions

### **Cultural Adaptation Features**
- **RTL Layout Support**: Proper right-to-left text direction and navigation
- **Cultural Content**: Region-specific environmental challenges and solutions
- **Local Partnerships**: Alexandria-focused organizations and initiatives
- **Currency & Formatting**: Localized number and date formatting

### **Accessibility Standards**
- **Screen Reader Support**: Semantic labels and navigation aids
- **High Contrast Mode**: Enhanced visibility for visual impairments
- **Font Scaling**: Responsive text sizing for readability
- **Touch Accessibility**: Appropriate touch targets and gesture support

---

## 🤝 Contributing to GreeAlex

### **Development Workflow**
1. **Fork the Repository**: Create your own copy for development
2. **Create Feature Branch**: `git checkout -b feature/amazing-environmental-feature`
3. **Implement Changes**: Follow coding standards and architectural patterns
4. **Write Tests**: Ensure comprehensive coverage for new functionality
5. **Commit Changes**: `git commit -m 'Add amazing environmental feature'`
6. **Push Branch**: `git push origin feature/amazing-environmental-feature`
7. **Create Pull Request**: Provide detailed description and testing instructions

### **Code Quality Standards**
- **Dart Style Guide**: Follow official Dart formatting and naming conventions
- **Documentation**: Comprehensive comments for complex logic and public APIs
- **Error Handling**: Robust error management with user-friendly messages
- **Performance**: Efficient algorithms and memory usage optimization

### **Pull Request Guidelines**
- **Clear Description**: Explain the purpose and impact of changes
- **Visual Documentation**: Include screenshots for UI modifications
- **Testing Evidence**: Demonstrate that all tests pass successfully
- **Documentation Updates**: Keep README and code comments current

---

## 📄 License & Legal

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for complete details.

### **Third-Party Acknowledgments**
- **Flutter Framework**: Google's UI toolkit for cross-platform development
- **Material Design**: Google's design system for consistent user experience
- **Poppins Font**: Indian Type Foundry's modern geometric typeface
- **Community Packages**: Various open-source Flutter packages and plugins

---

## 🙏 Acknowledgments & Recognition

### **Project Leadership**
- **Lead Developer**: Eng. **Fady Gerges Kodsy** - Visionary architect and primary developer
- **Strategic Partner**: **AlexBank** - Financial partnership and environmental commitment
- **Community Support**: Alexandria Environmental Groups - Local guidance and feedback

### **Technical Contributions**
- **Flutter Team**: For providing an exceptional cross-platform development framework
- **Open Source Community**: Contributors to packages and tools that make this project possible
- **Environmental Organizations**: For inspiration and real-world sustainability guidance

---

## 📞 Support & Community

### **Getting Help**
- **Technical Issues**: [GitHub Issues](https://github.com/FadyKodsy/gree_alex/issues)
- **Feature Requests**: [GitHub Discussions](https://github.com/FadyKodsy/gree_alex/discussions)
- **Documentation**: [Project Wiki](https://github.com/FadyKodsy/gree_alex/wiki)
- **Email Support**: support@greealex.com

### **Community Engagement**
- **Environmental Impact**: Join our mission to make Alexandria more sustainable
- **Developer Community**: Contribute to open-source environmental technology
- **Local Partnerships**: Connect with Alexandria-based environmental organizations
- **Educational Outreach**: Support environmental education and awareness programs

---

**Made with 💚 for a sustainable future in Alexandria, Egypt**

*GreeAlex - Where environmental action meets community impact*

---

**© 2024 GreeAlex Project. Developed by Eng. Fady Gerges Kodsy in partnership with AlexBank.**
