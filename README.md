# Glider for Hacker News

[<img src="https://cdn.rawgit.com/steverichey/google-play-badge-svg/master/img/en_get.svg" alt="Get it on Google Play" height="80">][play store]
[<img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png" alt="Get it on F-Droid" height="80">][f-droid]

Glider is an opinionated Hacker News client. Ad-free, open-source, no-nonsense.

- Browse stories, comments and user profiles
- Catch up on and search stories from any period
- Log in using an existing or new Hacker News account
- Vote on and favorite stories and comments
- Write replies and submit new stories (experimental)
- Collapse comment trees
- No ads, no telemetry
- Extensive theming
- Sensible defaults

<p>
  <img width="164px" src="./fastlane/metadata/android/en-US/images/phoneScreenshots/1.png">
  <img width="164px" src="./fastlane/metadata/android/en-US/images/phoneScreenshots/2.png">
  <img width="164px" src="./fastlane/metadata/android/en-US/images/phoneScreenshots/3.png">
  <img width="164px" src="./fastlane/metadata/android/en-US/images/phoneScreenshots/4.png">
  <img width="164px" src="./fastlane/metadata/android/en-US/images/phoneScreenshots/5.png">
</p>

## Development

Glider is built with the latest beta version of Flutter. Code that can be generated is not included in the repository. Generate it by running `build_runner`:

```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

[play store]: https://play.google.com/store/apps/details?id=nl.viter.glider
[f-droid]: https://f-droid.org/packages/nl.viter.glider
