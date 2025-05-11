namespace Bidi
{
	public class UnicodeCharMap
	{
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

		public const byte RLI = 20;

		public const byte LRI = 19;

		public const byte FSI = 21;

		public const byte PDI = 22;

		public const byte UD = byte.MaxValue;

		public const byte TYPE_MIN = 0;

		public const byte TYPE_MAX = 22;

		public static readonly byte[] baseMap;

		public static readonly byte[] baseMap2;
	}
}
