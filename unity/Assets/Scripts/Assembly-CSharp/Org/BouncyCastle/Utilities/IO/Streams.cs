using System.IO;

namespace Org.BouncyCastle.Utilities.IO
{
	public sealed class Streams
	{
		private const int BufferSize = 512;

		private Streams()
		{
		}

		public static void Drain(Stream inStr)
		{
		}

		public static byte[] ReadAll(Stream inStr)
		{
			return null;
		}

		public static byte[] ReadAllLimited(Stream inStr, int limit)
		{
			return null;
		}

		public static int ReadFully(Stream inStr, byte[] buf)
		{
			return 0;
		}

		public static int ReadFully(Stream inStr, byte[] buf, int off, int len)
		{
			return 0;
		}

		public static void PipeAll(Stream inStr, Stream outStr)
		{
		}

		public static long PipeAllLimited(Stream inStr, long limit, Stream outStr)
		{
			return 0L;
		}
	}
}
