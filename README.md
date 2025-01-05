# HomeMentor

**HomeMentor** is a family-focused app offering AI-powered guidance for collaborative decision-making. Designed to foster harmony and inclusivity, HomeMentor empowers families to maintain shared context, ask personalized questions, and leverage AI as a harmonious advisor.

---

## Features

### 🌟 Core Features
- **Shared Family Context**: Maintain a dynamic family context collaboratively updated by all members.
- **Personalized Questions**: Each family member can interact with the AI from their unique perspective.
- **AI-Powered Insights**: Integrates with top LLM APIs (OpenAI, Anthropic, etc.) to provide thoughtful guidance.
- **Collaborative Decision-Making**: Encourages family discussions with balanced AI input.

### 🔧 Planned Features
- **Multi-Language Support**: Ensure inclusivity for families across the globe.
- **Shared Question History**: Allow family members to view and learn from each other's interactions.
- **AI Personality Customization**: Tailor the AI's tone and advice style to fit your family dynamics.
- **Democratic Voting System**: Introduce a voting feature for group decision-making.
- **Offline Support**: Enable access to saved contexts and interactions even without internet.

---

## Technology Stack

- **Frontend**: [Flutter](https://flutter.dev) for cross-platform compatibility.
- **Backend**: [Supabase](https://supabase.io) for real-time database and authentication.
- **AI Integration**: Supports multiple LLM APIs (OpenAI, Anthropic, etc.).

---

## Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
- A Supabase account and project set up.
- API keys for desired LLM providers (e.g., OpenAI, Anthropic).

### Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/HomeMentor.git
   cd HomeMentor
   ```
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Set up your Supabase project:
   - Create a `.env` file in the root directory.
   - Add your Supabase keys and LLM API keys:
     ```env
     SUPABASE_URL=your-supabase-url
     SUPABASE_API_KEY=your-supabase-api-key
     OPENAI_API_KEY=your-openai-api-key
     ```
4. Run the app:
   ```bash
   flutter run
   ```

---

## Contributing

We welcome contributions from the community! To contribute:
1. Fork the repository.
2. Create a feature branch:
   ```bash
   git checkout -b feature-name
   ```
3. Commit your changes and push to your fork.
4. Create a pull request describing your changes.

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

## Roadmap

- [ ] Implement shared question history.
- [ ] Add multi-language support.
- [ ] Integrate AI personality customization.
- [ ] Build democratic voting system.
- [ ] Enhance offline support.

---

## Acknowledgments

Special thanks to the open-source community and the creators of Flutter, Supabase, and LLM APIs for making this project possible.

