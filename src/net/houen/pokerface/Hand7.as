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
	
	/**
		 * Represents a seven card poker hand.
		 * <p>Has methods to very quickly evaluate hand strength and category (one pair, flush etc.) by using CactusKev's poker hand analysis algorithm</p>
		 * <p>Can get and swap individual cards, and compare two poker hands to each other</p>
		 * <p>Tested to evaluate 133 mio. hands in approx. 2.5 hours on a 2.8 Ghz Core 2 Duo, or approx. 14.000 hands per second</p>
		 * @see net.houen.pokerface.Deck
		 * @see net.houen.pokerface.Card
		 */
	public class Hand7 extends AHand implements IHand
	{
		private var _cards:Array;
		private var _strength:uint;
		private var _strengthRank:uint;
		private var _name:String;
		
		/**
		 * Create new hand
		 * @param cardReps An array of card representations in the cactuskev format (often delivered by a hand pull from Deck class
		 * @param name A custom name for this hand
		 */
		public function Hand7(cardReps:Array,name:String = "")
		{
			super(7,cardReps,name);
			this.recalcStrength();
		}

		/**
		 * Set a card in the hand to a certain card.
		 * @param num The card number to change
		 * @param card The card to change to
		 * @see AHand
		 */		
		public function setCard(num:uint,card:Card):void
		{
			super.setTheCard(num,card);
			this.recalcStrength();
		}

		/**
		 * Recalculate the hand strength. Called automatically every time a hand is created or a card is changed
		 */
		public function recalcStrength():void
		{
			this.setStrength(PokerEval.eval_7hand([this.getCard(0).cardRep,this.getCard(1).cardRep,this.getCard(2).cardRep,this.getCard(3).cardRep,this.getCard(4).cardRep,this.getCard(5).cardRep,this.getCard(6).cardRep]));
		}
	}
}