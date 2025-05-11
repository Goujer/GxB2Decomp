using System.Collections.Generic;

namespace Bidi
{
	public class BidiPBAReference
	{
		public class BracketPair
		{
			private int ichOpener;

			private int ichCloser;

			public BracketPair(int ichOpener, int ichCloser)
			{
			}

			public static bool operator ==(BracketPair lh, BracketPair rh)
			{
				return false;
			}

			public static bool operator !=(BracketPair lh, BracketPair rh)
			{
				return false;
			}

			public int compareTo(BracketPair otherPair)
			{
				return 0;
			}

			public string toString()
			{
				return null;
			}

			public int getOpener()
			{
				return 0;
			}

			public int getCloser()
			{
				return 0;
			}
		}

		public const byte n = 0;

		public const byte o = 1;

		public const byte c = 2;

		private byte sos;

		private LinkedList<int> openers;

		private List<BracketPair> pairPositions;

		private byte[] initialCodes;

		public byte[] codesIsolatedRun;

		private int[] indexes;

		public const int MAX_PAIRING_DEPTH = 63;

		public string getPairPositionsString()
		{
			return null;
		}

		private bool matchOpener(int[] pairValues, int ichOpener, int ichCloser)
		{
			return false;
		}

		private void removeHead(LinkedList<int> list, int index)
		{
		}

		private void locateBrackets(byte[] pairTypes, int[] pairValues)
		{
		}

		private byte getStrongTypeN0(int ich)
		{
			return 0;
		}

		private byte classifyPairContent(BracketPair pairedLocation, byte dirEmbed)
		{
			return 0;
		}

		private byte classBeforePair(BracketPair pairedLocation)
		{
			return 0;
		}

		private void assignBracketType(BracketPair pairedLocation, byte dirEmbed)
		{
		}

		private void setBracketsToType(BracketPair pairedLocation, byte dirPair)
		{
		}

		public void resolveBrackets(byte dirEmbed)
		{
		}

		public void resolvePairedBrackets(int[] indexes, byte[] initialCodes, byte[] codes, byte[] pairTypes, int[] pairValues, byte sos, byte level)
		{
		}

		public void runAlgorithm(byte[] codes, byte[] pairTypes, int[] pairValues, byte sos, byte level)
		{
		}
	}
}
