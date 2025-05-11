using System.IO;

namespace Org.BouncyCastle.Utilities.IO.Pem
{
	public class PemReader
	{
		private const string BeginString = "-----BEGIN ";

		private const string EndString = "-----END ";

		private readonly TextReader reader;

		public TextReader Reader
		{
			get
			{
				return null;
			}
		}

		public PemReader(TextReader reader)
		{
		}

		public PemObject ReadPemObject()
		{
			return null;
		}

		private PemObject LoadObject(string type)
		{
			return null;
		}
	}
}
