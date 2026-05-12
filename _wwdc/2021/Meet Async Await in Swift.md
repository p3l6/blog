---
title: Meet Async Await in Swift
year: 2021
---
Asyncronous functions are already all over, with `completionHandler`, delegate callbacks, etc.

Completion handler code is complex to read, and prone to mistakes.

Some libraries have addressed this with futures, but these are still not checked by the compiler.

```swift
func fetchThumbnail(for id: String) async throws -> UIImage {
	let request = thumbnailURLRequesxt(for: id)
	let (data, response) = try await URLSession.shared.data(for: request)
	guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw FetchError.badId }
	let maybeImage = UIImage(data: data)
	guard let thumnail = await maybeImage?.thumbnail else { throw FetchError.badImage }
	return thumbnail
}
```
Compiler checks that a value is always returned, or an error is thrown, which it cannot do with a completion handler.

Both properties and functions can be async (though only readonly props can be async)

```swift
var thumbnail: UIImage? {
	get async {
		let size = CGSize(width: 40, height: 40)
		return await self.byPreparingAThumbnail(ofSize: size)
	}
}
```

await works in for loops, to loop over an async sequence.
See also: "Meet AsyncSequence" and "Explore structured concurrency in swift"

async functions suspend their execution on a thread when awaiting. The system will run other tasks on that thread, and eventually resume the awaited call.
Just calling await doesn't neccessarily guarantee the thread will need to suspend, that is up to what is happening inside the called function.
Be mindful that the entire state of your app may have changed by the time a function resumes!
Also, your function may resume onto any thread - not just the thread it started on.

#### facts
* async enables a function to suspend
* await marks where the function *may* suspend exectuion
* other work can happen during a suspension
* once the async function completes, execution resumes right after the await

testing: `XCTAssertNoThrow(try await self.mockViewModel.fetchThumnail(for: mockId))`

bridging between async and non-async code
```swift
var body: some View {
	Image(uiImage: self.image ?? placeholder)
		.onAppear { // onAppear expects a non-async closure
			Task.init { // similar to performOnMainThread, this blocks until complete
				// call to fetch is async
				self.image = try? await self.viewModel.fetchThumnail(for: post.id)
			}
		}
}
```
See also: "Discover concurrency in SwiftUI"

Start small converting with an async alternative to an existing API
Many many existing standard functions with completion handlers have automatic async counterparts now, provided by the compiler.

Apple recommends not to name aysnc functions with prefixes like `getTheThing`

To create an async alternative for your app's existing function:
1. Make an async function, probably mark it `throws`
2. Call the competion handler version
3. Wrap call with `return try await withCheckedThrowingContinuation {`
4. Inside your completion handler, call `continuation.resume(throwing: error)`, or `resume(returning:`

Very critical here to resume any continuations you create exactly once.
