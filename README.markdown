This [Actionscript Flash poker (5-card & Texas Hold’em)](http://blog.houen.net/actionscript-3-poker-hand-evaluator/ "Actionscript Flash poker (5-card & Texas Hold’em)") evaluator will evaluate more than 14,000 hands per second, with a size of around 6 kb. It also includes classes to wrap everything up nice and tight for convenience.

Starting from [this post](http://www.codingthewheel.com/archives/poker-hand-evaluator-roundup "Poker blog post") about poker hand evaluators, i converted the improved version of [Cactukev’s poker hand evaluator](http://www.suffecool.net/poker/evaluator.html "Cactukev’s poker hand evaluator") to AS3 some time ago, and wrapped it in some nice OO classes to make it easily accessible.

The OO classes include ways to handle a Deck of cards, a Dealer to draw cards from it, objects to represent a 5- and 7-card hand and compare strengths, and a Card class to make card strength and textual representation easy.

The straight dope is that I have tested it to evaluate approx. 2.6 mio. 5-card poker hands in 6.3 seconds, and 133 mio. 7-card poker hands in approx. 2.5 hours, or about 14.000 hands per second. The test evaluated the correct evaluation of all possible 5- and 7-card poker hands.
The tests were run on a 2.8 gHz Macbook Pro with 4Gb RAM

*Included in the library*

source code
.swc binary
API reference
The test to evaluate that it runs correctly here (AIR application)

*License:*
The original code i ported it from was released to the public domain, and is as such free to use, modify and redistribute.
I am releasing this code under the MIT license. License info is found in the source files.