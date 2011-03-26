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
	public class AHand
	{
		private var _cards:Array;
		private var _strength:uint;
		private var _strengthRank:uint;
		private var _name:String;
		
		protected var HAND_CARDS_NUM:uint;
		
		/**
		 * Create new hand
		 * @param cardReps An array of card representations in the cactuskev format (often delivered by a hand pull from Deck class
		 * @param name A custom name for this hand
		 * @throw HandError Thrown if wrong number of cards supplied in argument
		 */
		public function AHand(numCards:uint,cardReps:Array,name:String)
		{
			if(cardReps.length != numCards)
				throw new HandError("Wrong number of cards supplied in card parameter array");
			this.HAND_CARDS_NUM = numCards;
			this._cards = new Array(HAND_CARDS_NUM);
			this._name = name;
			
			if(cardReps.length < HAND_CARDS_NUM)
				throw new HandError("Too few cards for hand creation");
			
			for(var i:int = 0; i < HAND_CARDS_NUM; i++) {
				this._cards[i] = new Card(cardReps[i],name + i);
			}
		
		}
		
		/**
		 * Get a Card in the hand
		 * @param num The number of card to get. Must be between 0 and 4
		 * @throws HandError Will throw a HandError if invalid number given as parameter
		 * @return Card
		 * @see Card
		 */
		public function getCard(num:uint):Card
		{
			if(num > HAND_CARDS_NUM - 1 || num < 0)
				throw new HandError("Cannot get card " + num + " from a 5 card hand. (Cards are 0-indexed)")
			return this._cards[num];
		}
		
		/**
		 * Set a card in the hand. Will recalculate hand strength when set, so use with caution
		 * @param num The number of the card to set (0-4)
		 * @param card The new Card object to replace card with
		 * @throws HandError Will throw a HandError if invalid number given as parameter
		 * @see Card
		 */
		protected function setTheCard(num:uint,card:Card):void
		{
			if(num > HAND_CARDS_NUM - 1 || num < 0)
				throw new HandError("Cannot set card " + num + " in a 5 card hand. (Cards are 0-indexed)")
			this._cards[num] = card;
		}
		
		/**
		 * Get the hands strength in cactuskev format
		 * @return int
		 */
		public function get strength():int
		{
			return this._strength; 
		}
		
		/**
		 * Get the name of the current hand category (One Pair, Flush, etc.)
		 * @return String
		 */
		public function get category():String
		{
			return PokerVars.handRank[this._strengthRank];
		}
		
		/**
		 * Compare two hands to eachother
		 * @param otherHand a Hand5 object representing the hand to be compared to
		 * @return Returns 1 if this hand is greater, -1 if this hand is lesser, 0 if equal
		 */
		public function compare(handOther:AHand):int
		{
			var thisStren:uint = this.strength;
			var otherStren:uint = handOther.strength;
			
			//This hand is strongest
			if(thisStren < otherStren)
				return 1;
			//Other hand is strongest
			else if(thisStren > otherStren)
				return -1;
			//Hands are equal
			return 0;
		}
		
		/**
		 * The string representation of the hand
		 */
		public function toString():String
		{
			var str:String = this.category + "(" + this.strength + ")" + " (";
			for each(var card:Card in this._cards) {
				str += card.toString() + " ";
			}
			str = str.substr(0,str.length - 1);
			str += ")";
			return str;
		}
		
		/**
		 * Set the hands cactuskev strength (unique hand strength for every possible poker hand)
		 */
		protected function setStrength(strength:int):void
		{
			this._strength = strength;
			this._strengthRank = PokerLib.hand_rank(this.strength); 
		}
	}
}