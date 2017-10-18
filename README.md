Wordsy
====

#### What?

Wordsy is a Rails application that does one simple thing: scroll through/filter a list of words to find the one you want, click on it and that word gets "spoken."

(I say "words" but you could use short phrases as well, it just might be a litte harder to read the index.)

#### Why?

A few days ago, my dad, one of the smartest people I know, had a mild stroke which affected the language center of his brain. 

Dad can understand most things and he can, for the most part, still read. However, he can't speak, write, or type fluently. The language is there and he knows what he wants to say. He just can't get the words out.

We're hoping he'll recover. In the mean time, I built this app to try and help give him a voice. I'm putting it out on the internet so maybe it can help others, as well.

#### How?

Under the hood, it uses Amazon Polly to generate audio when new words are added, so you won't need to create or upload your own audio files. 

There's a basic interface to add and delete words, and a simple filtering by the first letter of a word. Words are automatically alphabetized.

#### First Steps

You'll need an AWS account so you can use the Polly service, and you'll need to create an IAM user for it. See [here](http://docs.aws.amazon.com/polly/latest/dg/getting-started.html) for more info. Polly is dirt cheap and comes with a 12mo free tier you'd be hard pressed to outgrow using this app.

After you get the Rails application up and running, you'll find a rake task called `words:top_1000`. This task will populate the database with the 1000 most common words in the English language. You'll probably wantn to customize the word list further by removing and adding some things, but this gives you a good base to get started.

#### Next Steps

I built Wordsy in a hurry, in order to attempt to help my dad, during a very stressful time. There are several things I didn't do. Some of them are super obvious.

* Admin Interface - Wordsy needs a pssword-protected admin UI for adding/deleting words. I just ran it on a private server and bookmarked URLs to save time.
* Test Coverage - There is none.
* A female voice option - Obviously my dad isn't female, so I didn't do this. It would be nice to build voice selection into an admin UI, but for now you can easily change it on line 34 of `entry.rb`. I recommend Amy.
