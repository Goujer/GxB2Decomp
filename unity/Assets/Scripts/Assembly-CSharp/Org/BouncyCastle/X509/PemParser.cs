using System.IO;
using Org.BouncyCastle.Asn1;

namespace Org.BouncyCastle.X509
{
	internal class PemParser
	{
		private readonly string _header1;

		private readonly string _header2;

		private readonly string _footer1;

		private readonly string _footer2;

		internal PemParser(string type)
		{
		}

		private string ReadLine(Stream inStream)
		{
			return null;
		}

		internal Asn1Sequence ReadPemObject(Stream inStream)
		{
			return null;
		}
	}
}
