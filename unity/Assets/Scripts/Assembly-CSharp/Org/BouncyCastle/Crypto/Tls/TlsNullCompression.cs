using System.IO;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class TlsNullCompression : TlsCompression
	{
		public virtual Stream Compress(Stream output)
		{
			return null;
		}

		public virtual Stream Decompress(Stream output)
		{
			return null;
		}
	}
}
