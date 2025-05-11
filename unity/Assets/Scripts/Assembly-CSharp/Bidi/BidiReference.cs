namespace Bidi
{
	public sealed class BidiReference
	{
		private class DirectionalStatusStack
		{
			private int stackCounter;

			private readonly byte[] embeddingLevelStack;

			private readonly byte[] overrideStatusStack;

			private readonly bool[] isolateStatusStack;

			public void Empty()
			{
			}

			public void Push(byte level, byte overrideStatus, bool isolateStatus)
			{
			}

			public void Pop()
			{
			}

			public int Depth()
			{
				return 0;
			}

			public byte LastEmbeddingLevel()
			{
				return 0;
			}

			public byte LastDirectionalOverrideStatus()
			{
				return 0;
			}

			public bool LastDirectionalIsolateStatus()
			{
				return false;
			}
		}

		private class IsolatingRunSequence
		{
			private readonly int[] indexes;

			private readonly byte[] types;

			private byte[] resolvedLevels;

			private readonly int length;

			private readonly byte level;

			private readonly byte sos;

			private readonly byte eos;

			private readonly BidiReference parent;

			public IsolatingRunSequence(int[] inputIndexes, BidiReference bidi)
			{
			}

			public void ResolvePairedBrackets()
			{
			}

			public void ResolveWeakTypes()
			{
			}

			public void ResolveNeutralTypes()
			{
			}

			public void ResolveImplicitLevels()
			{
			}

			public void ApplyLevelsAndTypes()
			{
			}

			private int FindRunLimit(int index, int limit, byte[] validSet)
			{
				return 0;
			}

			private void SetTypes(int start, int limit, byte newType)
			{
			}

			private void AssertOnly(byte[] codes)
			{
			}
		}

		private readonly byte[] initialTypes;

		public const byte implicitEmbeddingLevel = 2;

		private byte paragraphEmbeddingLevel;

		private int textLength;

		private byte[] resultTypes;

		private byte[] resultLevels;

		private int[] matchingPDI;

		private int[] matchingIsolateInitiator;

		private readonly byte[] pairTypes;

		private readonly int[] pairValues;

		public BidiPBAReference pba;

		public const byte L = 0;

		public const byte LRE = 1;

		public const byte LRO = 2;

		public const byte R = 3;

		public const byte AL = 4;

		public const byte RLE = 5;

		public const byte RLO = 6;

		public const byte PDF = 7;

		public const byte EN = 8;

		public const byte ES = 9;

		public const byte ET = 10;

		public const byte AN = 11;

		public const byte CS = 12;

		public const byte NSM = 13;

		public const byte BN = 14;

		public const byte B = 15;

		public const byte S = 16;

		public const byte WS = 17;

		public const byte ON = 18;

		public const byte LRI = 19;

		public const byte RLI = 20;

		public const byte FSI = 21;

		public const byte PDI = 22;

		public const byte TYPE_MIN = 0;

		public const byte TYPE_MAX = 22;

		private const char LRM = '\u200e';

		private const char RLM = '\u200f';

		private const char ALM = '\u061c';

		public static readonly string[] typenames;

		public const int MAX_DEPTH = 125;

		public BidiReference(byte[] types, byte[] pairTypes, int[] pairValues)
		{
		}

		public BidiReference(byte[] types, byte[] pairTypes, int[] pairValues, byte paragraphEmbeddingLevel)
		{
		}

		public byte[] getResultTypes()
		{
			return null;
		}

		private void RunAlgorithm()
		{
		}

		private void DetermineMatchingIsolates()
		{
		}

		private byte DetermineParagraphEmbeddingLevel(int startIndex, int endIndex)
		{
			return 0;
		}

		private void DetermineExplicitEmbeddingLevels()
		{
		}

		private int[][] DetermineLevelRuns()
		{
			return null;
		}

		private IsolatingRunSequence[] DetermineIsolatingRunSequences()
		{
			return null;
		}

		private int AssignLevelsToCharactersRemovedByX9()
		{
			return 0;
		}

		public byte[] GetLevels(int[] linebreaks)
		{
			return null;
		}

		public int[] GetReordering(int[] linebreaks)
		{
			return null;
		}

		private static int[] ComputeMultilineReordering(byte[] levels, int[] linebreaks)
		{
			return null;
		}

		private static int[] ComputeReordering(byte[] levels)
		{
			return null;
		}

		public byte GetBaseLevel()
		{
			return 0;
		}

		private static bool IsWhitespace(byte biditype)
		{
			return false;
		}

		private static bool IsZeroWidthType(byte biditype, char ch)
		{
			return false;
		}

		public static bool IsRemovedByX9(byte biditype)
		{
			return false;
		}

		private static byte TypeForLevel(int level)
		{
			return 0;
		}

		private void SetLevels(byte[] levels, int start, int limit, byte newLevel)
		{
		}

		private static void ValidateTypes(byte[] types)
		{
		}

		private static void ValidateParagraphEmbeddingLevel(byte paragraphEmbeddingLevel)
		{
		}

		private static void ValidateLineBreaks(int[] linebreaks, int textLength)
		{
		}

		private static void ValidatePbTypes(byte[] pairTypes)
		{
		}

		private static void ValidatePbValues(int[] pairValues, byte[] pairTypes)
		{
		}

		public static BidiReference AnalyzeInput(byte[] types, byte[] pairTypes, int[] pairValues, byte paragraphEmbeddingLevel)
		{
			return null;
		}

		private static byte[] GetCodes(string str)
		{
			return null;
		}

		private static byte GetBracketType(char ch)
		{
			return 0;
		}

		private static byte[] GetBracketTypes(string str)
		{
			return null;
		}

		private static char MapCanon(char chBracket)
		{
			return '\0';
		}

		private static char GetPairedBracket(char ch)
		{
			return '\0';
		}

		private static int[] GetBracketValues(string str)
		{
			return null;
		}

		private byte[] GetResultLevel()
		{
			return null;
		}

		private static string ReplaceInputChar(string str)
		{
			return null;
		}

		public static string GetSingleLineDisplay(string str, int baseLevel = 2, bool replaceChar = true)
		{
			return null;
		}

		public static string GetDisplay(string inputStr, int baseLevel = 2, bool replaceChar = true)
		{
			return null;
		}

		public static string GetBBCodeDisplay(string inputStr, int baseLevel = 2)
		{
			return null;
		}

		public static string GetBBCodeDisplay2(string inputStr, int baseLevel = 2)
		{
			return null;
		}

		public static int GetBaseLevel(string inputStr)
		{
			return 0;
		}

		public static int GetBBCodeBaseLevel(string inputStr)
		{
			return 0;
		}

		public static int GetHtmlBaseLevel(string inputStr)
		{
			return 0;
		}
	}
}
