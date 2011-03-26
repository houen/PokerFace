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
	import net.houen.cactuskev.PokerLib;
	import net.houen.cactuskev.PokerVars;
	
	/**
		 * Represents a playing card with cactuskev poker strength
		 */
	public class Card
	{
		private var _valueNum:uint;
		private var _valueString:String;
		private var _suit:String;
		private var _name:String;
		
		private var _cardRep:uint;
		
		/**
		 * Create new palying card
		 * @param cardRep The cards representation in cactuskev notation
		 * @param name An optional id name for the card
		 */
		public function Card(cardRep:uint, name:String = "")
		{
			this._cardRep = cardRep;
			this._valueNum = PokerVars.cardRankNum[PokerLib.RANK(cardRep)];
			this._valueString = PokerVars.cardRank[PokerLib.RANK(cardRep)];
			this._suit = PokerLib.SUIT(cardRep);
			this._name = name;
		}
		
		/**
		 * Get the cards suit
		 * @return String
		 */
		public function get suit():String
		{
			return this._suit;
		}
		
		/**
		 * Get the cards numerical value (2 to 14)
		 */ 
		public function get value():uint
		{
			return this._valueNum;
		}
		
		/**
		 * Get the cards string value (2 to A)
		 */
		public function get valueName():String
		{
			return this._valueString;
		}
		
		/**
		 * Get the cards cactuskev representation
		 */
		public function get cardRep():uint
		{
			return this._cardRep;
		}
		
		/**
		 * Get the cards id name
		 */
		public function get name():String
		{
			return this._name;
		}
		
		/**
		 * Get the cards string representation
		 */
		public function toString():String
		{
			return "" + this.valueName + this.suit;
		}

	}
}