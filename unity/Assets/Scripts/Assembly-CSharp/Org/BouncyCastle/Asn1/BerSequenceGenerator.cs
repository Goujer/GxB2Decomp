using System.IO;

namespace Org.BouncyCastle.Asn1
{
	public class BerSequenceGenerator : BerGenerator
	{
		public BerSequenceGenerator(Stream outStream)
			: base(null)
		{
		}

		public BerSequenceGenerator(Stream outStream, int tagNo, bool isExplicit)
			: base(null)
		{
		}
	}
}
