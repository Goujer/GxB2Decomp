using System.IO;
using Org.BouncyCastle.Utilities.IO;

namespace Org.BouncyCastle.Asn1
{
	internal abstract class LimitedInputStream : BaseInputStream
	{
		protected readonly Stream _in;

		private int _limit;

		internal LimitedInputStream(Stream inStream, int limit)
		{
		}

		internal virtual int GetRemaining()
		{
			return 0;
		}

		protected virtual void SetParentEofDetect(bool on)
		{
		}
	}
}
