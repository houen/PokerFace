/*Copyright (c) 2009 Søren Houen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.*/

package net.houen.pokerface
{
	import net.houen.cactuskev.PokerEval;
	import net.houen.cactuskev.PokerLib;
	import net.houen.cactuskev.PokerVars;
	import net.houen.pokerface.error.HandError;
	
	/**
		 * Represents a poker hand.
		 * <p>Has methods to very quickly evaluate hand strength and category (one pair, flush etc.) by using CactusKev's poker hand analysis algorithm</p>
		 * <p>Can get and swap individual cards, and compare two poker hands to each other</p>
		 * <p>Tested to evaluate 2,598,960 hands in 6.3 seconds on a 2.6 Ghz Dual Core Macbook Pro</p>
		 * @see net.houen.pokerface.Deck
		 * @see net.houen.pokerface.Card
		 */
	public interface IHand
	{
		/**
		 * Get a Card in the hand
		 * @param num The number of card to get. Must be between 0 and 4
		 * @throws HandError Will throw a HandError if invalid number given as parameter
		 * @return Card
		 * @see Card
		 */
		function getCard(num:uint):Card;
		
		/**
		 * Set a card in the hand. Will recalculate hand strength when set, so use with caution
		 * @param num The number of the card to set (0-4)
		 * @param card The new Card object to replace card with
		 * @throws HandError Will throw a HandError if invalid number given as parameter
		 * @see Card
		 */
		function setCard(num:uint,card:Card):void;
		
		/**
		 * Get the hands strength in cactuskev format
		 * @return int
		 */
		function get strength():int;
		
		/**
		 * Get the name of the current hand category (One Pair, Flush, etc.)
		 * @return String
		 */
		function get category():String;
		
		/**
		 * The string representation of the hand
		 */
		function toString():String;
	
		/**
		 * Set the hands cactuskev strength (unique hand strength for every possible poker hand)
		 */
		function recalcStrength():void;
		
		/**
		 * Compare two hands to eachother
		 * @param otherHand a Hand5 object representing the hand to be compared to
		 * @return Returns 1 if this hand is greater, -1 if this hand is lesser, 0 if equal
		 */
		function compare(handOther:AHand):int;
	}
}