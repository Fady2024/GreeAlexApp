# GreenAlex Chatbot Feature 🤖

## Overview
The GreenAlex Chatbot is an intelligent sustainability assistant integrated into the GreeAlex app. It helps users with eco-friendly actions, AlexBank green banking services, and earning Green Points.

## Features

### 🌱 Sustainability Focus
- **Eco-friendly Tips**: Get personalized sustainability advice for Alexandria
- **Action Suggestions**: Discover ways to reduce environmental impact
- **Local Context**: Tailored recommendations for Alexandria residents

### 🏦 AlexBank Integration
- **Green Banking**: Learn about sustainable banking products
- **Eco-friendly Services**: Discover green credit cards and investment options
- **Partnership Benefits**: Access exclusive offers for sustainable choices

### ⭐ Green Points System
- **Earning Points**: Learn how to earn points through eco-actions
- **Rewards Information**: Discover available rewards and how to redeem them
- **Progress Tracking**: Get tips on maximizing your Green Points

### 🎨 UI/UX Features
- **Floating Button**: Elegant floating action button on the home screen
- **Animated Interactions**: Smooth animations and transitions
- **Bilingual Support**: Full Arabic and English localization
- **Smart Responses**: Context-aware responses based on user queries

## Components

### 1. Floating Chatbot Widget (`FloatingChatbotWidget`)
- Positioned as a floating circle at the bottom right of the home screen
- Includes pulse animation and tooltip
- Provides easy access to the chatbot

### 2. Chat Screen (`ChatbotScreen`)
- Full-screen chat interface
- Message bubbles with different types (user, bot, info cards)
- Quick action buttons for common queries
- Clear chat and help functionality

### 3. Message Types
- **Standard Messages**: Basic text responses
- **Banking Info Cards**: Rich cards with AlexBank service information
- **Sustainability Tips**: Interactive cards with eco-action suggestions
- **Quick Actions**: Buttons for common follow-up questions

### 4. Chatbot Service (`ChatbotService`)
- Handles message processing and response generation
- Context-aware responses based on keywords
- Manages conversation history
- Generates appropriate response types

## Usage

### For Users
1. **Access**: Tap the floating green chat button on the home screen
2. **Ask Questions**: Type natural language questions about:
   - Sustainability and eco-actions
   - AlexBank services and green banking
   - Green Points earning and redemption
   - Volunteer events and opportunities
3. **Interact**: Use quick action buttons for common queries
4. **Get Help**: Access the help menu for topic suggestions

### For Developers
1. **Extend Responses**: Add new response patterns in `ChatbotService`
2. **Add Message Types**: Create new message types in `ChatMessage` model
3. **Customize UI**: Modify bubble styles in `ChatMessageBubble`
4. **Localization**: Add new translations in `app_en.arb` and `app_ar.arb`

## Localization

The chatbot supports both English and Arabic with the following translations:
- Interface labels and buttons
- Help content and instructions
- Sample responses and tips
- Error messages and confirmations

## Smart Response Categories

### 1. Sustainability Queries
Keywords: `recycle`, `sustainable`, `environment`, `green`, `eco`
- Provides local sustainability tips
- Suggests eco-actions with point values
- Offers quick actions for related topics

### 2. Banking Queries  
Keywords: `bank`, `banking`, `account`, `loan`, `credit`, `saving`
- Information about AlexBank green services
- Sustainable banking product recommendations
- Partnership benefits and offers

### 3. Points & Rewards
Keywords: `points`, `reward`, `earn`, `redeem`, `green points`
- Ways to earn Green Points
- Available rewards and redemption process
- Point values for different actions

### 4. Volunteering
Keywords: `volunteer`, `event`, `beach cleanup`, `tree planting`
- Current volunteer opportunities
- Event details and participation info
- Point rewards for volunteering

### 5. Greetings & Help
Keywords: `hello`, `hi`, `help`, `assist`
- Welcome messages with quick actions
- Help topics and usage instructions
- Navigation assistance

## Technical Implementation

### Architecture
- **Model**: `ChatMessage` with different types and metadata
- **Service**: `ChatbotService` for message processing
- **UI**: Modular widgets for different components
- **Localization**: Integrated with app's i18n system

### Key Files
```
lib/features/chatbot/
├── domain/
│   ├── models/
│   │   └── chat_message.dart
│   └── services/
│       └── chatbot_service.dart
└── presentation/
    ├── screens/
    │   └── chatbot_screen.dart
    └── widgets/
        ├── chat_message_bubble.dart
        └── floating_chatbot_widget.dart
```

### Integration Points
- **Home Screen**: Floating widget overlay
- **Localization**: ARB files for translations
- **Theme**: Consistent with app's design system
- **Navigation**: Modal presentation from home screen

## Future Enhancements

### Planned Features
- [ ] Integration with actual AlexBank APIs
- [ ] AI-powered responses using language models
- [ ] Voice message support
- [ ] Image sharing for eco-actions
- [ ] Push notifications for sustainability tips
- [ ] Chat history persistence
- [ ] Advanced analytics and insights

### Potential Integrations
- [ ] Real-time volunteer event updates
- [ ] Weather-based sustainability suggestions
- [ ] Location-based eco-action recommendations
- [ ] Social sharing of achievements
- [ ] Integration with fitness apps for transport tracking

## Contributing

When adding new features to the chatbot:

1. **Extend Response Logic**: Add new patterns to `_generateResponse` method
2. **Add Message Types**: Create new message types for rich content
3. **Update Translations**: Add new strings to localization files
4. **Test Thoroughly**: Ensure responses work in both languages
5. **Document Changes**: Update this README with new features

## Support

For issues or questions about the chatbot feature:
- Check the help menu within the app
- Review this documentation
- Contact the development team for technical support
