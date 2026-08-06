![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/iamnijat/code-quizzy/Flutter%20CI/master)
![GitHub forks](https://img.shields.io/github/forks/iamnijat/code-quizzy)
![GitHub stars](https://img.shields.io/github/stars/iamnijat/code-quizzy)
![GitHub watchers](https://img.shields.io/github/watchers/iamnijat/code-quizzy)
![GitHub contributors](https://img.shields.io/github/contributors/iamnijat/code-quizzy)
![GitHub last commit](https://img.shields.io/github/last-commit/iamnijat/code-quizzy)
![GitHub top language](https://img.shields.io/github/languages/top/iamnijat/code-quizzy)

# Flutter Code Quizzy Application


![mockup](https://user-images.githubusercontent.com/42466886/151920669-91c23fbb-d38a-4401-a865-c65ffece840a.png)


-------

## Configuration for this application

Besides the Flutter development setup on your computer, this project needs a
[quizapi.io](https://quizapi.io) API key. The key is **not** stored in the repo — it is passed
in at build time and read via `String.fromEnvironment`:

```bash
flutter run   --dart-define=QUIZ_API_KEY=qa_sk_your_api_key
flutter build --dart-define=QUIZ_API_KEY=qa_sk_your_api_key
```

In VS Code, add it to `.vscode/launch.json` instead so you don't have to pass it every time:

```json
{
  "configurations": [
    {
      "name": "code_quizzy",
      "request": "launch",
      "type": "dart",
      "toolArgs": ["--dart-define=QUIZ_API_KEY=qa_sk_your_api_key"]
    }
  ]
}
```

Without the key the app shows a "Missing API Key" screen rather than failing silently.

The app talks to the v1 API, which authenticates with an `Authorization: Bearer <key>` header
and returns its payloads inside a `{success, data, meta}` envelope. Topics are loaded at
runtime from `GET /api/v1/categories`, so the topic list never goes stale.

You've done entire steps correctly and I make sure that this project will have paramount effect on your progress learning `Flutter`
