# RedditFeed
TikTok like feed for image based subreddits. Allows users to login and scroll through the media of a couple of subreddits, like posts, view and upvote comments.


### Next Steps
- Fetch feeds with oauth
- Allows us to fetch state of liked posts, comments
- Pull to refresh
- More testing
- Handle upvote error
- Don't require login for viewing feed
- Move upvote/downvote network request to separate class


Project Structure
├── RedditFeedApp: Main App class
│   ├── ViewControllers
│   │   ├── *hareSheetViewController: Required to show share sheet
│   ├── Extensions: Any class extensions for standard libraries
│   ├── Shared: Other classes
│   ├── Models: All App models
│   ├── Services: All network related code
│   ├── ViewModels: ViewModels for Feeds, Comments and Login
│   ├── Views: All View code
│   │   ├── Login
│   │   ├── Home/Feed
│   │   ├── Posts
│   │   ├── UFI
│   ├── Preview Assets: Used for mocking data on view previews and tests
│   ├── RedditFeedTests
│   ├── RedditFeedUITests
