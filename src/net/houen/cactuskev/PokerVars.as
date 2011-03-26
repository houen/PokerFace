package net.houen.cactuskev
{
	public class PokerVars
	{
		public static const   STRAIGHT_FLUSH:int  = 1;
        public static const   FOUR_OF_A_KIND:int = 2;
        public static const   FULL_HOUSE:int = 3;
        public static const   FLUSH:int = 4;
        public static const   STRAIGHT:int = 5;
        public static const   THREE_OF_A_KIND:int = 6;
        public static const   TWO_PAIR:int = 7;
        public static const   ONE_PAIR:int = 8;
        public static const   HIGH_CARD:int = 9;

        public static const   CLUB:int = 0x8000;
        public static const   DIAMOND:int = 0x4000;
        public static const   HEART:int = 0x2000;
        public static const   SPADE:int = 0x1000;

        public static const   Deuce:int = 0;
        public static const   Trey:int = 1;
        public static const   Four:int = 2;
        public static const   Five:int = 3;
        public static const   Six:int = 4;
        public static const   Seven:int = 5;
        public static const   Eight:int = 6;
        public static const   Nine:int = 7;
        public static const   Ten:int = 8;
        public static const   Jack:int = 9;
        public static const   Queen:int = 10;
        public static const   King:int = 11;
        public static const   Ace:int = 12;
        
        public static const handRank:Array = ['ERROR HAND!', 'Straight Flush', 'Four of a Kind', 'Full House', 'Flush', 'Straight', 'Three of a Kind', 'Two Pair', 'One Pair', 'High Card'];
        public static const cardRank:Array = ['2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K', 'A'];
        public static const cardRankNum:Array = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14];
	}
}