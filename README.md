# RedditFeed
TikTok like feed for image based subreddits. Allows users to login and scroll through the media of a couple of subreddits, like posts, view and upvote comments.

### How To
1. Add Config file with Reddit App key ([how-to link](https://medium.com/swift-india/secure-secrets-in-ios-app-9f66085800b4))
2. Add OAuthSwift package
3. Run App

### Next Steps
- Fetch feeds with oauth
- Allows us to fetch state of liked posts, comments
- Pull to refresh
- More testing
- Handle upvote error
- Don't require login for viewing feed
- Move upvote/downvote network request to separate class


### Project Structure

- RedditFeedApp: Main App class
- ViewControllers
  - ShareSheetViewController: Required to show share sheet
- Extensions: Any class extensions for standard libraries
- Shared: Other classes
- Models: All App models
- Services: All network related code
- ViewModels: ViewModels for Feeds, Comments and Login
- Views: All View code
  - Login
  - Home/Feed
  - Posts
  - UFI
- Preview Assets: Used for mocking data on view previews and tests
- RedditFeedTests
- RedditFeedUITests
