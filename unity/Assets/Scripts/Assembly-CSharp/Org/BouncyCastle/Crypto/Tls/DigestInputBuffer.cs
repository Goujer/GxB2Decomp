using System.IO;
using Org.BouncyCastle.Utilities.IO;

namespace Org.BouncyCastle.Crypto.Tls
{
	internal class DigestInputBuffer : MemoryStream
	{
		private class DigStream : BaseOutputStream
		{
			private readonly IDigest d;

			internal DigStream(IDigest d)
			{
			}

			public override void WriteByte(byte b)
			{
			}

			public override void Write(byte[] buf, int off, int len)
			{
			}
		}

		internal void UpdateDigest(IDigest d)
		{
		}
	}
}
