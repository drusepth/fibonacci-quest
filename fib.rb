require "active_support/core_ext/integer/inflections" # int.ordinalize

N = 2 + rand(10)

$largest_n = 1 #todo make this a class var for FibonaccisQuest < StoryGenerator

def write passage
	if passage.is_a?(Array)
		puts "     #{passage.join.gsub("\n", "\n\n     ")}"
	else
		puts "     #{passage.gsub("\n", "\n\n     ")}"
	end
end

def title
	write [
		"FIBONACCI'S QUEST (n=#{N})",
		"\n"
	]
end

def intro
	write [
		"Fibonacci stood over his aching mother, deeply sick from a terrible flu. ",
		"\"I'll get the money we need for your medicine, mother,\" he promised. ",
		"\"It'll be a lot, but I can do it. I have a plan.",
		"\n",
		"Rather than asking for such a large sum upfront, he devises a devious plan. ",
		"With great pain in his heart, he steals one dollar from his mother’s purse. ",
		"It was all she had: she was saving for her favorite soda, something her illness had more of a chance to take away from her than he. ",
		"With dollar in hand and plan in mind, Fibonacci predicts it will take #{N - 2} kings to agree to his plan.",
		"He gave his mom a great hug and set off on an adventure towards the closest king."
	]
end

def quest
	fib(N)
end

def fib(n, writing: true)
	return 1 if n == 2 # Avoid the first city for the sake of the story.
	return n if n <= 1

	if n > $largest_n
		if writing
			write [
				"As he arrived in the #{(n - 2).ordinalize} city, he set his sights towards the king's grand palace. ",
				'"Please help me," he begged the king, telling tales of his mother and her illness. ',
				"\"You're the third king I've seen,\" ",
				(fib(n - 1) < 3 ? "he lied, " : "he said, "),
				"\"the last two kings I saw were very helpful, ",
				"\"but I bet you're richer than both of them combined! My could be well in no time with your help, your highness.\"",
				"\n",
				'"Oh, I can\'t have them outdoing me!", the king protested. "How much did they give?"',
				"\n",
				"\"They  offered me $#{fib(n - 2)}.00 and $#{fib(n-1)}.00,\" Fibonacci lied. ",
				"\"Together, that means $#{fib(n-1) + fib(n-2)}.00 towards her medicine. Look here!\"",
				"\n",
				"\"Ah, yes,\" the king stuttered, saving face. \"I am richer than them! ",
				"I'll send you on your way with $#{fib(n - 1) + fib(n - 2)}.00 more.\"",
				"\n",
				"\"Thank you, your highness,\" Fibonacci yelled. \"You don't know how much that helps!\" ",
				"After collecting from the king, Fibonacci returned to his horse and set sights for the next king, ",
				"worried sick about his mother."
			]
		end
		$largest_n = n
	end

	fib(n - 1) + fib(n - 2)
end

def outro
	write [
		"Fibonacci enthusiastically thanked the king again as he recounted the bag of money he had just filled. ",
		"\"This should be enough,\" he said, encouragingly. He looked pensively in the direction toward home. ",
		"\"Godspeed,\" the king said, and Fibonacci was off.",
		"\n",
		"He rode tirelessly through the night to find his mother still in the bed that he'd left her in #{N - 2} kings ago.",
		"\n",
		"\"Mother, I'm here!\" Fibonacci cried out, brandishing medicine, newly purchased. \"It's going to be okay!\""
	]

	if N > N - rand(N)
		happy_ending
	else
		sad_ending
	end
end

def happy_ending
	write [
		"A faint whisper scratched back from the shadows: \"Fibonacci? Is that you, Fibonacci?\"",
		"\n",
		"\"Yes, mother! And look here, I have the medicine you needed! Here, take some. You'll make it through this.\"",
		"\n",
		"The old woman took her medicine, and immediately began feeling better. ",
		"The initial effect may have been mostly placebo, but hope cares not. ",
		"Fibonacci's mother made a full recovery."
	]
end

def sad_ending
	write [
		"There was silence in the room, and the heaviness of death hung palpably in the air. ",
		"\n",
		"\"Mother,\" Fibonacci repeated nervously, calling out louder in the darkness. \"I'm here!\"",
		"\n",
		"But no response came from the dark, and Fibonacci sunk to the floor with the weight of the world, ",
		"knowing it was now too late to save her. ",
		"\n",
		"A single tear on his cheek foretold the grand weeping that followed. ",
		"Fibonacci fell abruptly to the floor, sobbing uncontrollably. ",
		"She would not be forgotten."
	]
end

# Story
title
intro
quest
outro
